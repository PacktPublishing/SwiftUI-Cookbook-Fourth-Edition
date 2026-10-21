//
//  FridgeView.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI
import FoundationModels

struct FridgeView: View {
  @State private var chef = FridgeChef()
  private let photo = UIImage(resource: .fridgeSample)
  private let model = SystemLanguageModel.default

  var body: some View {
    Form {
      Section {
        Image(uiImage: photo)
          .resizable()
          .scaledToFit()
          .frame(maxHeight: 240)
          .frame(maxWidth: .infinity)
        if model.capabilities.contains(.vision) {
          Button("What Can I Cook?", systemImage: "sparkles") {
            Task { await chef.suggest(from: photo) }
          }
          .disabled(chef.isResponding)
          if chef.isResponding {
            ProgressView("Looking at the photo...")
          }
        } else {
          Text("The on-device model cannot read images on this device.")
            .foregroundStyle(.secondary)
        }
      }
      if let dish = chef.suggestion {
        DishSections(dish: dish)
      }
      if let message = chef.errorMessage {
        Text(message)
          .foregroundStyle(.red)
      }
    }
    .navigationTitle("Fridge")
  }
}

#Preview {
  NavigationStack {
    FridgeView()
  }
}
