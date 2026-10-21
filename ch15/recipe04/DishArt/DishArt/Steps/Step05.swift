//
//  Step05.swift
//  DishArt
//
//  Created by Juan Catalan on 9/29/26.
//

import SwiftUI
import ImagePlayground

/// Step 5: The progress view while the sheet opens, and the availability
/// check. The preview canvas shows the unavailable message, because simulated
/// devices cannot create images; an iPhone shows the button.
/// Book recipe steps: 3, 4, 5
struct Step05View: View {
  @Environment(\.supportsImagePlayground) private var supportsImagePlayground
  @State private var dish = "Spinach and feta omelette"
  @State private var artwork: UIImage?
  @State private var isPlaygroundPresented = false
  @FocusState private var isEditingDish

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
            Button("Create Artwork", systemImage: "apple.image.playground") {
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
      concepts: [.text(dish)],
      onCompletion: { url in
        artwork = UIImage(contentsOfFile: url.path())
      }
    )
  }
}

#Preview {
  Step05View()
}
