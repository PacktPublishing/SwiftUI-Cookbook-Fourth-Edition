//
//  ContentView.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

struct ContentView: View {
  @State private var store = ScoreboardStore()
  @State private var showingAddPlayer = false
  @State private var newPlayerName = ""
  @State private var showingResetConfirmation = false

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
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Player", systemImage: "plus") {
            showingAddPlayer = true
          }
        }
        ToolbarItem(placement: .topBarLeading) {
          Button("Reset", role: .destructive) {
            showingResetConfirmation = true
          }
          .disabled(store.players.isEmpty)
        }
      }
      .alert("New Player", isPresented: $showingAddPlayer) {
        TextField("Name", text: $newPlayerName)
        Button("Add") {
          let name = newPlayerName.trimmingCharacters(in: .whitespaces)
          if !name.isEmpty {
            store.addPlayer(name: name)
          }
          newPlayerName = ""
        }
        Button("Cancel", role: .cancel) {
          newPlayerName = ""
        }
      } message: {
        Text("Enter the player's name.")
      }
      .alert("Reset Scoreboard?", isPresented: $showingResetConfirmation) {
        Button("Delete All Players", role: .destructive) { store.resetAll() }
        Button("Cancel", role: .cancel) { }
      } message: {
        Text("This permanently removes every player and their scores.")
      }
    }
  }
}

#Preview {
  ContentView()
}
