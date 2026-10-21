//
//  Step03.swift
//  MyCountry
//
//  Created by Juan Catalan on 9/12/26.
//

import SwiftUI

/// Step 3: The row of country buttons below the question
/// Book recipe step: 3
struct Step03View: View {
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
      }
    }
    .padding()
  }
}

#Preview {
  Step03View()
}
