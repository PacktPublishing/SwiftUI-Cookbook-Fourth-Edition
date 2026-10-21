//
//  PhotoDetailView.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import SwiftUI

struct PhotoDetailView: View {
  let photo: DogPhoto
  let breed: Breed
  @Environment(\.dismiss) private var dismiss

  private var imageRequest: URLRequest {
    URLRequest(url: photo.url, cachePolicy: .returnCacheDataElseLoad)
  }

  var body: some View {
    NavigationStack {
      VStack(spacing: 16) {
        AsyncImage(
          request: imageRequest,
          transaction: Transaction(animation: .easeInOut(duration: 0.5))
        ) { phase in
          switch phase {
          case .empty:
            Rectangle()
              .fill(.gray.opacity(0.1))
              .aspectRatio(3 / 2, contentMode: .fit)
              .overlay {
                ProgressView("Loading full image...")
              }
          case .success(let image):
            image
              .resizable()
              .scaledToFit()
              .transition(.opacity)
          case .failure:
            ContentUnavailableView(
              "Image Unavailable",
              systemImage: "photo",
              description: Text("Could not load the full image.")
            )
          @unknown default:
            EmptyView()
          }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
        Spacer()
      }
      .navigationTitle(breed.displayName)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .cancellationAction) {
          Button(role: .close) { dismiss() }
        }
      }
    }
  }
}

#Preview {
  if let photo = DogPhoto.preview {
    PhotoDetailView(photo: photo, breed: .husky)
  }
}
