//
//  Step05.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI

/// Step 5: The first version of the fridge view: the bundled photo, the What
/// Can I Cook? button, and the dish the model suggests from the photo. The
/// image-support check comes in step 7.
/// Book recipe steps: 3, 4, 5
struct Step05View: View {
  @State private var chef = FridgeChef()
  private let photo = UIImage(resource: .fridgeSample)

  var body: some View {
    NavigationStack {
      Form {
        Section {
          Image(uiImage: photo)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 240)
            .frame(maxWidth: .infinity)
          Button("What Can I Cook?", systemImage: "sparkles") {
            Task { await chef.suggest(from: photo) }
          }
          .disabled(chef.isResponding)
          if chef.isResponding {
            ProgressView("Looking at the photo...")
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
}

#Preview {
  Step05View()
}
