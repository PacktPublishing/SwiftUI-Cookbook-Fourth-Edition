//
//  Step06.swift
//  MedalStandings
//
//  Created by Juan Catalan on 7/9/26.
//

import SwiftUI

/// Step 6: Summary row with gridCellColumns spanning and gridCellAnchor
/// Book recipe step: 6
struct Step06View: View {
  private let countries = Country.sampleData

  private var grandTotal: Int {
    countries.reduce(0) { $0 + $1.total }
  }

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
      Divider()
        .gridCellUnsizedAxes(.horizontal)
      GridRow {
        Text("Total medals awarded")
          .font(.caption)
          .foregroundStyle(.secondary)
          .gridCellColumns(4)
          .gridCellAnchor(.trailing)
        Text("\(grandTotal)")
          .font(.callout.bold())
          .monospacedDigit()
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
  Step06View()
}
