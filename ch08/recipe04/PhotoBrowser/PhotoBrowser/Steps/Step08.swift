//
//  Step08.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import SwiftUI

/// Step 8: The fully browsable app: tapping a thumbnail presents the
/// full-size photo view in a sheet.
/// Book recipe steps: 7, 8
struct Step08View: View {
  @State private var viewModel = GalleryViewModel()
  @State private var selectedBreed = Breed.husky
  @State private var selectedPhoto: DogPhoto?

  private let columns = [
    GridItem(.flexible(), spacing: 2),
    GridItem(.flexible(), spacing: 2),
    GridItem(.flexible(), spacing: 2)
  ]

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        breedPicker
        if viewModel.isLoading {
          Spacer()
          ProgressView("Loading photos...")
          Spacer()
        } else if let errorMessage = viewModel.errorMessage {
          ContentUnavailableView {
            Label("Loading Failed", systemImage: "exclamationmark.triangle")
          } description: {
            Text(errorMessage)
          } actions: {
            Button("Retry") {
              Task { await viewModel.loadPhotos(breed: selectedBreed) }
            }
          }
        } else {
          photoGrid
        }
      }
      .navigationTitle("Photo Browser")
      .task(id: selectedBreed) {
        await viewModel.loadPhotos(breed: selectedBreed)
      }
      .sheet(item: $selectedPhoto) { photo in
        PhotoDetailView(photo: photo, breed: selectedBreed)
      }
    }
  }

  private var breedPicker: some View {
    Picker("Breed", selection: $selectedBreed) {
      ForEach(Breed.allCases) { breed in
        Text(breed.displayName).tag(breed)
      }
    }
    .pickerStyle(.segmented)
    .padding(.horizontal)
    .padding(.vertical, 8)
  }

  private var photoGrid: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 2) {
        ForEach(viewModel.photos) { photo in
          Button {
            selectedPhoto = photo
          } label: {
            PhotoThumbnailView(photo: photo)
          }
        }
      }
    }
  }
}

#Preview {
  Step08View()
}
