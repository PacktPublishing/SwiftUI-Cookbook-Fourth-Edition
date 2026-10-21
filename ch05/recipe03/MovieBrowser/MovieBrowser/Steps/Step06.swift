//
//  Step06.swift
//  MovieBrowser
//
//  Created by Juan Catalan on 5/23/26.
//

import SwiftUI

/// Step 6: The list owns the MovieStore with @StateObject; .searchable feeds
/// the Combine pipeline and a toolbar menu changes the sort. Rows are
/// read-only until the detail screen exists.
/// Book recipe steps: 1, 2, 3, 4, 5, 6
struct Step06View: View {
  @StateObject private var store = MovieStore()
  var body: some View {
    NavigationStack {
      List {
        Section("\(store.resultCount) movies") {
          ForEach(store.results) { movie in
            MovieRowView(movie: movie,
                         isFavorite: store.isFavorite(movie))
          }
        }
      }
      .navigationTitle("Movies")
      .searchable(text: $store.query, prompt: "Search titles")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Menu {
            ForEach(SortOrder.allCases) { order in
              Button(order.rawValue) {
                store.setSort(order)
              }
            }
          } label: {
            Image(systemName: "arrow.up.arrow.down")
          }
        }
      }
      .overlay {
        if store.results.isEmpty {
          ContentUnavailableView.search(text: store.query)
        }
      }
    }
  }
}

#Preview {
  Step06View()
}
