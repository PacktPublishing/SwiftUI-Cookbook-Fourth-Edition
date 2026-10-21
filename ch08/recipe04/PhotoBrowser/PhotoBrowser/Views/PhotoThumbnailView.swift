//
//  PhotoThumbnailView.swift
//  PhotoBrowser
//
//  Created by Juan Catalan on 7/8/26.
//

import SwiftUI

struct PhotoThumbnailView: View {
  let photo: DogPhoto

  private var imageRequest: URLRequest {
    URLRequest(url: photo.url, cachePolicy: .returnCacheDataElseLoad)
  }

  var body: some View {
    AsyncImage(request: imageRequest) { image in
      image
        .resizable()
        .scaledToFill()
    } placeholder: {
      Rectangle()
        .fill(.gray.opacity(0.1))
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120, maxHeight: 120)
    .clipped()
  }
}

#Preview {
  if let photo = DogPhoto.preview {
    PhotoThumbnailView(photo: photo)
      .frame(width: 130)
  }
}
