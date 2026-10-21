//
//  MovieRowView.swift
//  MovieBrowser
//
//  Created by Juan Catalan on 5/23/26.
//

import SwiftUI

struct MovieRowView: View {
  let movie: Movie
  let isFavorite: Bool
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 2) {
        Text(movie.title)
        Text("\(movie.genre) · \(movie.yearText)")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      Spacer()
      if isFavorite {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
      }
    }
  }
}

#Preview {
  List {
    MovieRowView(movie: Movie.catalog[0], isFavorite: true)
    MovieRowView(movie: Movie.catalog[1], isFavorite: false)
  }
}
