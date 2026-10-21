//
//  ContentView.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI
import FoundationModels

struct ContentView: View {
  @State private var chef = Chef()
  @State private var request = "Something quick for dinner"
  @FocusState private var isEditingRequest: Bool
  private let model = SystemLanguageModel.default

  var body: some View {
    NavigationStack {
      Group {
        switch model.availability {
        case .available:
          Form {
            Section("What are you in the mood for?") {
              TextField("Request", text: $request, axis: .vertical)
                .focused($isEditingRequest)
              Button("Suggest a Dish", systemImage: "fork.knife") {
                isEditingRequest = false
                Task { await chef.suggest(from: request) }
              }
              .disabled(chef.isResponding || request.isEmpty)
              if chef.isResponding {
                ProgressView("Thinking...")
              }
            }
            if !chef.activity.isEmpty {
              Section("What the model did") {
                ForEach(chef.activity) { item in
                  VStack(alignment: .leading) {
                    Text(item.title)
                    Text(item.detail)
                      .font(.caption.monospaced())
                      .foregroundStyle(.secondary)
                  }
                }
              }
            }
            if let dish = chef.suggestion {
              Section(dish.name) {
                LabeledContent("Ready in", value: "\(dish.minutes) minutes")
                ForEach(dish.ingredients, id: \.self) { Text($0) }
              }
              Section("Steps") {
                ForEach(dish.steps.enumerated(), id: \.element) { index, step in
                  Text("\(index + 1). \(step)")
                }
              }
            }
            if let message = chef.errorMessage {
              Text(message)
                .foregroundStyle(.red)
            }
          }
          .toolbar {
            NavigationLink {
              PantryView(pantry: chef.pantry)
            } label: {
              Label("Pantry", systemImage: "refrigerator")
            }
          }
        case .unavailable(.deviceNotEligible):
          ContentUnavailableView(
            "Device Not Supported",
            systemImage: "iphone.slash",
            description: Text("This device doesn't support Apple Intelligence.")
          )
        case .unavailable(.appleIntelligenceNotEnabled):
          ContentUnavailableView(
            "Apple Intelligence Is Off",
            systemImage: "apple.intelligence",
            description: Text("Turn it on in Settings to get dish suggestions.")
          )
        case .unavailable(.modelNotReady):
          ContentUnavailableView(
            "Model Not Ready",
            systemImage: "arrow.down.circle",
            description: Text("The model is downloading. Try again later.")
          )
        case .unavailable:
          ContentUnavailableView(
            "Apple Intelligence Unavailable",
            systemImage: "exclamationmark.triangle"
          )
        }
      }
      .navigationTitle("PantryChef")
    }
  }
}

#Preview {
  ContentView()
}
