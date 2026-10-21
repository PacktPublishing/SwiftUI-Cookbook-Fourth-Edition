//
//  Step09.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

/// Step 9: The main screen lists the players in a NavigationStack, with a
/// show-averages toggle and swipe-to-delete wired to the store.
/// Book recipe steps: 1, 2, 3, 4, 5, 6, 7, 8, 9
struct Step09View: View {
  @State private var store = ScoreboardStore()

  var body: some View {
    NavigationStack {
      List {
        Section {
          Toggle("Show Averages", isOn: $store.showAverages)
        }
        Section("Players") {
          if store.players.isEmpty {
            Text("No players yet. Tap + to add one.")
              .foregroundStyle(.secondary)
          } else {
            ForEach(store.players) { player in
              NavigationLink {
                PlayerDetailView(playerID: player.id, store: store)
              } label: {
                PlayerRowView(player: player, showAverage: store.showAverages)
              }
            }
            .onDelete(perform: store.removePlayers)
          }
        }
      }
      .navigationTitle("Score Tracker")
    }
  }
}

#Preview {
  Step09View()
}
