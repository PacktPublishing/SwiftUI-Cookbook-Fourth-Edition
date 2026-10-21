//
//  ScoreboardStore.swift
//  ScoreTracker
//
//  Created by Juan Catalan on 6/27/26.
//

import SwiftUI

enum DefaultsKey {
  static let players = "savedPlayers"
  static let showAverages = "showAverages"
}

@Observable
final class ScoreboardStore {
  var players: [Player] = []

  var showAverages: Bool {
    didSet {
      UserDefaults.standard.set(showAverages, forKey: DefaultsKey.showAverages)
    }
  }

  init() {
    showAverages = UserDefaults.standard.bool(forKey: DefaultsKey.showAverages)
    players = Self.loadPlayers()
  }

  func addPlayer(name: String) {
    players.append(Player(name: name))
    save()
  }

  func addScore(_ score: Int, to player: Player) {
    guard let index = players.firstIndex(where: { $0.id == player.id })
    else { return }
    players[index].scores.append(score)
    save()
  }

  func removePlayers(at offsets: IndexSet) {
    players.remove(atOffsets: offsets)
    save()
  }

  func resetAll() {
    players.removeAll()
    UserDefaults.standard.removeObject(forKey: DefaultsKey.players)
  }

  private func save() {
    let encoder = PropertyListEncoder()
    if let data = try? encoder.encode(players) {
      UserDefaults.standard.set(data, forKey: DefaultsKey.players)
    }
  }

  private static func loadPlayers() -> [Player] {
    let decoder = PropertyListDecoder()
    guard let data = UserDefaults.standard.data(forKey: DefaultsKey.players),
          let players = try? decoder.decode([Player].self, from: data)
    else { return [] }
    return players
  }
}
