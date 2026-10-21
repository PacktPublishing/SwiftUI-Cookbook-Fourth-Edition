//
//  Step04.swift
//  MyCountry
//
//  Created by Juan Catalan on 9/12/26.
//

import SwiftUI

/// Step 4: The finished view with the Reset button, before any identifiers
/// Book recipe step: 4
struct Step04View: View {
  static let countries = ["USA", "Spain", "France", "Italy"]
  @State private var selectedCountry = Self.countries[0]
  @State private var counter = 0

  var body: some View {
    VStack {
      Text("What is your country of origin?")
        .font(.headline)
      HStack(spacing: 12) {
        ForEach(Self.countries, id: \.self) { country in
          Button(country) {
            selectedCountry = country
            counter += 1
          }
          .buttonStyle(.glassProminent)
          .tint(selectedCountry == country ? .red : .blue)
        }
      }
      Spacer()
      Text(selectedCountry)
        .font(.largeTitle)
        .bold()
      Spacer()
      HStack {
        Text("Number of taps: \(counter)")
        Spacer()
        Button("Reset") {
          selectedCountry = Self.countries[0]
          counter = 0
        }
        .buttonStyle(.glass)
      }
    }
    .padding()
  }
}

#Preview {
  Step04View()
}
