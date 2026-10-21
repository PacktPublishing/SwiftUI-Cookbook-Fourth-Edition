//
//  ContentView.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = MusicSearchViewModel()

  var body: some View {
    NavigationStack {
      List(viewModel.tracks) { track in
        TrackRowView(track: track)
      }
      .listStyle(.plain)
      .overlay {
        if viewModel.isSearching {
          ProgressView("Searching...")
        } else if let errorMessage = viewModel.errorMessage {
          ContentUnavailableView {
            Label("Search Failed", systemImage: "exclamationmark.triangle")
          } description: {
            Text(errorMessage)
          }
        } else if viewModel.tracks.isEmpty && viewModel.query.isEmpty {
          ContentUnavailableView(
            "Search for Music",
            systemImage: "music.note",
            description: Text("Type a song or artist name.")
          )
        } else if viewModel.tracks.isEmpty {
          ContentUnavailableView.search(text: viewModel.query)
        }
      }
      .navigationTitle("Music Search")
      .searchable(text: $viewModel.query, prompt: "Songs and artists")
    }
  }
}

#Preview {
  ContentView()
}
