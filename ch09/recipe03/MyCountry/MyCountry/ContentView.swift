//
//  ContentView.swift
//  MyCountry
//
//  Created by Juan Catalan on 9/12/26.
//

import SwiftUI

struct ContentView: View {
  static let countries = ["USA", "Spain", "France", "Italy"]
  @State private var selectedCountry = Self.countries[0]
  @State private var counter = 0

  var body: some View {
    VStack {
      Text("What is your country of origin?")
        .font(.headline)
        .accessibilityIdentifier("Question")
      HStack(spacing: 12) {
        ForEach(Self.countries, id: \.self) { country in
          Button(country) {
            selectedCountry = country
            counter += 1
          }
          .buttonStyle(.glassProminent)
          .tint(selectedCountry == country ? .red : .blue)
          .accessibilityIdentifier(String(country.prefix(2)).uppercased())
        }
      }
      Spacer()
      Text(selectedCountry)
        .font(.largeTitle)
        .bold()
        .accessibilityIdentifier("SelectedCountry")
      Spacer()
      HStack {
        Text("Number of taps: \(counter)")
          .accessibilityIdentifier("NumberOfTaps")
        Spacer()
        Button("Reset") {
          selectedCountry = Self.countries[0]
          counter = 0
        }
        .buttonStyle(.glass)
        .accessibilityIdentifier("Reset")
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
