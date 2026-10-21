//
//  ContentView.swift
//  TripBoard
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

struct ContentView: View {
  @State private var stops = Stop.samples
  @State private var isArranging = false
  private let columns = [GridItem(.flexible()), GridItem(.flexible())]

  var body: some View {
    NavigationStack {
      ScrollView {
        board
      }
      .navigationTitle("Trip Board")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button(isArranging ? "Done" : "Arrange") {
            isArranging.toggle()
          }
        }
      }
    }
  }

  private var board: some View {
    LazyVGrid(columns: columns, spacing: 12) {
      ForEach(stops) { stop in
        stopTile(for: stop)
      }
      .reorderable()
    }
    .reorderContainer(for: Stop.self, isEnabled: isArranging) { difference in
      difference.apply(to: &stops)
    }
    .padding(.horizontal)
  }

  @ViewBuilder
  private func stopTile(for stop: Stop) -> some View {
    let day = (stops.firstIndex { $0.id == stop.id } ?? 0) + 1
    ZStack {
      RoundedRectangle(cornerRadius: 16)
        .fill(stop.color.gradient)
      VStack(spacing: 8) {
        Image(systemName: stop.symbol)
          .font(.system(size: 36))
        Text(stop.name)
          .font(.headline)
        Text("Day \(day)")
          .font(.caption.bold())
          .padding(.horizontal, 8)
          .padding(.vertical, 2)
          .background(.white.opacity(0.25), in: .capsule)
      }
      .foregroundStyle(.white)
    }
    .frame(height: 140)
  }
}

#Preview {
  ContentView()
}
