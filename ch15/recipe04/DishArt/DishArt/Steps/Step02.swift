//
//  Step02.swift
//  DishArt
//
//  Created by Juan Catalan on 9/29/26.
//

import SwiftUI
import ImagePlayground

/// Step 2: The form with the dish name, the artwork placeholder, and the
/// Create Artwork button that presents the Image Playground sheet.
/// Book recipe steps: 1, 2
struct Step02View: View {
  @State private var dish = "Spinach and feta omelette"
  @State private var artwork: UIImage?
  @State private var isPlaygroundPresented = false

  var body: some View {
    Form {
      Section("Dish") {
        TextField("Dish name", text: $dish)
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
        Button("Create Artwork", systemImage: "apple.image.playground") {
          isPlaygroundPresented = true
        }
        .disabled(dish.isEmpty)
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
  Step02View()
}
