//
//  Step02.swift
//  MedalStandings
//
//  Created by Juan Catalan on 7/9/26.
//

import SwiftUI

/// Step 2: Grid rows with the flag and name fixed to a single line
/// Book recipe step: 2
struct Step02View: View {
  private let countries = Country.sampleData

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          standingsCard
        }
        .padding()
      }
      .navigationTitle("Medal Standings")
    }
  }

  private var standingsCard: some View {
    Grid(alignment: .center, horizontalSpacing: 12, verticalSpacing: 10) {
      ForEach(countries) { country in
        GridRow {
          Text(country.displayName)
            .fixedSize(horizontal: true, vertical: false)
          Group {
            Text("\(country.gold)")
            Text("\(country.silver)")
            Text("\(country.bronze)")
            Text("\(country.total)")
              .fontWeight(.semibold)
          }
          .monospacedDigit()
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(.secondarySystemBackground))
    )
  }
}

#Preview {
  Step02View()
}
