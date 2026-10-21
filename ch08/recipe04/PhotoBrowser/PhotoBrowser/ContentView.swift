//
//  ContentView.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import SwiftUI

struct ContentView: View {
  @State private var viewModel = GalleryViewModel()
  @State private var selectedBreed = Breed.husky
  @State private var selectedPhoto: DogPhoto?

  private static let imageSession: URLSession = {
    let megabyte = 1024 * 1024
    let configuration = URLSessionConfiguration.default
    configuration.urlCache = URLCache(memoryCapacity: 64 * megabyte,
                                      diskCapacity: 256 * megabyte)
    return URLSession(configuration: configuration)
  }()

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
      .asyncImageURLSession(Self.imageSession)
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
  ContentView()
}
