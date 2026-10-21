//
//  Step03.swift
//  PhotoGallery
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 3: Horizontal carousel with snapping
/// Book recipe step: 3
struct Step03View: View {
  @State private var photos = Photo.samples
  @State private var scrolledID: Int?
  @State private var isScrolling = false
  @State private var showScrollToTop = false
  @State private var position = ScrollPosition(edge: .top)

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        carousel
        Text("Photo List")
      }
      .navigationTitle("Photo Gallery")
      .overlay(alignment: .bottomTrailing) {
        if showScrollToTop {
          Text("Scroll to top")
        }
      }
    }
  }

  private var carousel: some View {
    ScrollView(.horizontal) {
      LazyHStack(spacing: 0) {
        ForEach(photos) { photo in
          ZStack {
            RoundedRectangle(cornerRadius: 16)
              .fill(photo.color.gradient)
            VStack {
              Image(systemName: "photo.fill")
                .font(.system(size: 40))
                .foregroundStyle(.white.opacity(0.8))
              Text(photo.title)
                .font(.title3.bold())
                .foregroundStyle(.white)
            }
          }
          .padding(.horizontal, 20)
          .containerRelativeFrame(.horizontal)
        }
      }
      .scrollTargetLayout()
    }
    .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
    .scrollPosition(id: $scrolledID)
    .scrollIndicators(.hidden)
    .frame(height: 220)
  }
}

#Preview {
  Step03View()
}
