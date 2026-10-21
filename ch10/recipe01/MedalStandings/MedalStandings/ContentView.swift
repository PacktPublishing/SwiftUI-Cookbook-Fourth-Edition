//
//  ContentView.swift
//  MedalStandings
//
//  Created by Juan Catalan on 7/9/26.
//

import SwiftUI

struct ContentView: View {
  private let countries = Country.sampleData

  private var grandTotal: Int {
    countries.reduce(0) { $0 + $1.total }
  }

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 24) {
          standingsCard
          totalsCard
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
        headerContent
      }
      .font(.caption.bold())
      .foregroundStyle(.secondary)
      Divider()
        .gridCellUnsizedAxes(.horizontal)
      ForEach(countries) { country in
        GridRow {
          countryContent(country)
        }
      }
      Divider()
        .gridCellUnsizedAxes(.horizontal)
      GridRow {
        footerContent
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(.secondarySystemBackground))
    )
  }

  @ViewBuilder
  private var headerContent: some View {
    Text("Country")
      .gridColumnAlignment(.leading)
    Text("🥇")
    Text("🥈")
    Text("🥉")
    Text("Total")
      .gridColumnAlignment(.trailing)
  }

  @ViewBuilder
  private func countryContent(_ country: Country) -> some View {
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

  @ViewBuilder
  private var footerContent: some View {
    Text("Total medals awarded")
      .font(.caption)
      .foregroundStyle(.secondary)
      .gridCellColumns(4)
      .gridCellAnchor(.trailing)
    Text("\(grandTotal)")
      .font(.callout.bold())
      .monospacedDigit()
  }

  private var totalsCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Medal totals")
        .font(.headline)
      VStack(alignment: .barStart, spacing: 10) {
        ForEach(countries) { country in
          totalsRow(for: country)
        }
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color(.secondarySystemBackground))
    )
  }

  private func totalsRow(for country: Country) -> some View {
    HStack(spacing: 8) {
      Text(country.displayName)
      Capsule()
        .fill(.orange.gradient)
        .frame(width: CGFloat(country.total) * 5, height: 16)
        .alignmentGuide(.barStart) { dimension in
          dimension[.leading]
        }
      Text("\(country.total)")
        .font(.caption.monospacedDigit())
        .foregroundStyle(.secondary)
    }
  }
}

extension HorizontalAlignment {
  private enum BarStart: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
      context[.leading]
    }
  }
  static let barStart = HorizontalAlignment(BarStart.self)
}

#Preview {
  ContentView()
}
