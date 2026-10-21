//
//  MovieDetailView.swift
//  MovieBrowser
//
//  Created by Juan Catalan on 5/23/26.
//

import SwiftUI

struct MovieDetailView: View {
  @ObservedObject var store: MovieStore
  let movie: Movie
  var body: some View {
    Form {
      Section {
        LabeledContent("Year", value: movie.yearText)
        LabeledContent("Genre", value: movie.genre)
      }
      Section("Synopsis") {
        Text(movie.synopsis)
      }
      Section {
        Button {
          store.toggleFavorite(movie)
        } label: {
          Label(store.isFavorite(movie) ? "Remove from Favorites"
                  : "Add to Favorites",
                systemImage: store.isFavorite(movie) ? "star.slash"
                  : "star")
        }
      }
    }
    .navigationTitle(movie.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    MovieDetailView(store: MovieStore(), movie: Movie.catalog[0])
  }
}
