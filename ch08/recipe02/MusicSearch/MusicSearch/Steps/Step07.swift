//
//  Step07.swift
//  MusicSearch
//
//  Created by Juan Catalan on 7/7/26.
//

import SwiftUI

/// Step 7: The first working search screen, with a list of track rows, a
/// search field, and a task that searches on every query change.
/// Book recipe steps: 2, 3, 4, 5, 6, 7
struct Step07View: View {
  @State private var viewModel = MusicSearchViewModel()
  @State private var query = "The Beatles"

  var body: some View {
    NavigationStack {
      List(viewModel.tracks) { track in
        TrackRowView(track: track)
      }
      .listStyle(.plain)
      .navigationTitle("Music Search")
      .searchable(text: $query, prompt: "Songs and artists")
      .task(id: query) {
        await viewModel.search(for: query)
      }
    }
  }
}

#Preview {
  Step07View()
}
