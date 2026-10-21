//
//  ContentView.swift
//  DishArt
//
//  Created by Juan Catalan on 9/29/26.
//

import SwiftUI
import ImagePlayground

struct ContentView: View {
  @Environment(\.supportsImagePlayground) private var supportsImagePlayground
  @State private var dish = "Spinach and feta omelette"
  @State private var artwork: UIImage?
  @State private var isPlaygroundPresented = false
  @FocusState private var isEditingDish

  private var options: ImagePlaygroundOptions {
    var options = ImagePlaygroundOptions()
    options.creationStrategy = artwork == nil ? .generateNew : .editExisting
    options.sizeSpecification = .closest(to: CGSize(width: 1024, height: 1024))
    options.personalization = .disabled
    return options
  }

  var body: some View {
    Form {
      Section("Dish") {
        TextField("Dish name", text: $dish)
          .focused($isEditingDish)
      }
      Section("Artwork") {
        if let artwork {
          Image(uiImage: artwork)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12))
        } else {
          ContentUnavailableView(
            "No Artwork Yet",
            systemImage: "photo",
            description: Text("Name a dish and create its artwork.")
          )
        }
      }
      Section {
        if supportsImagePlayground {
          HStack {
            Button(
              artwork == nil ? "Create Artwork" : "Edit Artwork",
              systemImage: "apple.image.playground"
            ) {
              isEditingDish = false
              isPlaygroundPresented = true
            }
            .disabled(dish.isEmpty || isPlaygroundPresented)
            if isPlaygroundPresented {
              Spacer()
              ProgressView()
            }
          }
        } else {
          Text("Image Playground is not available on this device.")
            .foregroundStyle(.secondary)
        }
      }
    }
    .imagePlaygroundSheet(
      isPresented: $isPlaygroundPresented,
      concepts: [.text(dish), .text("plated on a rustic wooden table")],
      sourceImage: artwork.map { Image(uiImage: $0) },
      onCompletion: { url in
        artwork = UIImage(contentsOfFile: url.path())
      }
    )
    .imagePlaygroundGenerationStyle(.any, in: [.any, .illustration, .sketch])
    .imagePlaygroundOptions(options)
  }
}

#Preview {
  ContentView()
}
