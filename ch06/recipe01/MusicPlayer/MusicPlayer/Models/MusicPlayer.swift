//
//  MusicPlayer.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import SwiftUI

/// The shared playback state for the whole app. A single instance is injected
/// into the environment, and every screen reads and edits this same object.
/// `@Observable` tracks changes per property, so a view only re-renders when a
/// property it actually reads changes.
@Observable
class MusicPlayer {
  var tracks: [Track] = Track.library
  var currentTrack: Track?
  var isPlaying = false
  var volume = 0.5

  func play(_ track: Track) {
    currentTrack = track
    isPlaying = true
  }

  func togglePlayPause() {
    guard currentTrack != nil else { return }
    isPlaying.toggle()
  }

  func playNext() {
    guard let current = currentTrack,
          let index = tracks.firstIndex(where: { $0.id == current.id })
    else { return }
    play(tracks[(index + 1) % tracks.count])
  }

  func playPrevious() {
    guard let current = currentTrack,
          let index = tracks.firstIndex(where: { $0.id == current.id })
    else { return }
    play(tracks[(index - 1 + tracks.count) % tracks.count])
  }
}

extension MusicPlayer {
  /// A player with the first track already playing, for use in previews.
  static var preview: MusicPlayer {
    let player = MusicPlayer()
    player.play(Track.library[0])
    return player
  }
}
