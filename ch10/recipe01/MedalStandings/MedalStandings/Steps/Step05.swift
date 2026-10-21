//
//  Step05.swift
//  MedalStandings
//
//  Created by Juan Catalan on 7/9/26.
//

import SwiftUI

/// Step 5: Full-width dividers with gridCellUnsizedAxes
/// Book recipe step: 5
struct Step05View: View {
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
      GridRow {
        Text("🏅 Final Standings")
          .font(.headline)
          .gridCellColumns(5)
      }
      Divider()
        .gridCellUnsizedAxes(.horizontal)
      GridRow {
        Text("Country")
          .gridColumnAlignment(.leading)
        Text("🥇")
        Text("🥈")
        Text("🥉")
        Text("Total")
          .gridColumnAlignment(.trailing)
      }
      .font(.caption.bold())
      .foregroundStyle(.secondary)
      Divider()
        .gridCellUnsizedAxes(.horizontal)
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
  Step05View()
}
