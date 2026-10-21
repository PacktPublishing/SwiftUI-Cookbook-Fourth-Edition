//
//  PlayerRowView.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

struct PlayerRowView: View {
  let player: Player
  let showAverage: Bool

  var body: some View {
    HStack {
      Text(player.name)
      Spacer()
      if showAverage {
        Text("Avg: \(player.averageScore, specifier: "%.1f")")
          .foregroundStyle(.secondary)
      } else {
        Text("Total: \(player.totalScore)")
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  List {
    PlayerRowView(player: Player(name: "Alex", scores: [10, 25, 18]),
                  showAverage: true)
    PlayerRowView(player: Player(name: "Sam", scores: [12, 8]),
                  showAverage: false)
  }
}
