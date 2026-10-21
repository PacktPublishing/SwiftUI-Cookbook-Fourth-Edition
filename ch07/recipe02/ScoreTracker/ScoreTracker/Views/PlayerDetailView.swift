//
//  PlayerDetailView.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

struct PlayerDetailView: View {
  let playerID: Player.ID
  let store: ScoreboardStore
  @State private var newScore = ""

  private var player: Player? {
    store.players.first { $0.id == playerID }
  }

  var body: some View {
    if let player {
      List {
        Section("Scores") {
          if player.scores.isEmpty {
            Text("No scores yet.")
              .foregroundStyle(.secondary)
          } else {
            ForEach(Array(player.scores.enumerated()), id: \.offset) {
              index, score in
              LabeledContent("Round \(index + 1)", value: "\(score)")
            }
          }
        }
        Section("Add Score") {
          HStack {
            TextField("Score", text: $newScore)
              .keyboardType(.numberPad)
            Button("Add") {
              if let score = Int(newScore) {
                store.addScore(score, to: player)
                newScore = ""
              }
            }
            .disabled(Int(newScore) == nil)
          }
        }
        Section("Summary") {
          LabeledContent("Total", value: "\(player.totalScore)")
          LabeledContent("Average",
                         value: String(format: "%.1f", player.averageScore))
          LabeledContent("Games Played", value: "\(player.scores.count)")
        }
      }
      .navigationTitle(player.name)
    }
  }
}

#Preview {
  let store = ScoreboardStore()
  store.players = [Player(name: "Alex", scores: [10, 25, 18])]
  return NavigationStack {
    PlayerDetailView(playerID: store.players[0].id, store: store)
  }
}
