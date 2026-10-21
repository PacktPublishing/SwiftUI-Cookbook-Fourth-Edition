//
//  Step02.swift
//  MyCountry
//
//  Created by Juan Catalan on 9/12/26.
//

import SwiftUI

/// Step 2: The three Text views of the app, before the buttons
/// Book recipe steps: 1, 2
struct Step02View: View {
  static let countries = ["USA", "Spain", "France", "Italy"]
  @State private var selectedCountry = Self.countries[0]
  @State private var counter = 0

  var body: some View {
    VStack {
      Text("What is your country of origin?")
        .font(.headline)
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
  Step02View()
}
