//
//  MusicPlayer.swift
//  MusicPlayer
//
//  Created by Juan Catalan on 5/26/26.
//

import Combine

/// The shared playback state for the whole app, as an `ObservableObject`. A
/// single instance is injected into the environment, and every screen reads
/// and edits this same object. Each `@Published` property fires the object's
/// `objectWillChange` publisher, which refreshes every view observing the
/// object, whether or not it read the property that changed.
class MusicPlayer: ObservableObject {
  @Published var tracks: [Track] = Track.library
  @Published var currentTrack: Track?
  @Published var isPlaying = false
  @Published var volume = 0.5

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
