//
//  ContentView.swift
//  MovieBrowser
//
//  Created by Juan Catalan on 5/23/26.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var store = MovieStore()
  var body: some View {
    NavigationStack {
      List {
        Section("\(store.resultCount) movies") {
          ForEach(store.results) { movie in
            NavigationLink {
              MovieDetailView(store: store, movie: movie)
            } label: {
              MovieRowView(movie: movie,
                           isFavorite: store.isFavorite(movie))
            }
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
  ContentView()
}
