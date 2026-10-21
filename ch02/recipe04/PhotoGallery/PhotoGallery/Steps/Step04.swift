//
//  Step04.swift
//  PhotoGallery
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 4: Vertical photo list with scroll observation
/// Book recipe step: 4
struct Step04View: View {
  @State private var photos = Photo.samples
  @State private var scrolledID: Int?
  @State private var isScrolling = false
  @State private var showScrollToTop = false
  @State private var position = ScrollPosition(edge: .top)

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        carousel
        photoList
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

  private var photoList: some View {
    ScrollView {
      LazyVStack(spacing: 12) {
        ForEach(photos) { photo in
          HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
              .fill(photo.color.gradient)
              .frame(width: 60, height: 60)
              .overlay {
                Image(systemName: "photo")
                  .foregroundStyle(.white)
              }
            Text(photo.title)
              .font(.headline)
            Spacer()
          }
          .padding()
          .background(.background, in: .rect(cornerRadius: 12))
          .shadow(color: .black.opacity(0.05), radius: 4)
          .onScrollVisibilityChange(threshold: 0.5) { visible in
            if visible {
              print("\(photo.title) visible")
            }
          }
        }
      }
      .padding()
    }
    .scrollPosition($position)
    .scrollBounceBehavior(.basedOnSize)
    .scrollEdgeEffectStyle(.soft, for: .all)
    .onScrollPhaseChange { _, newPhase in
      withAnimation { isScrolling = newPhase.isScrolling }
    }
    .onScrollGeometryChange(for: Bool.self) { geo in
      geo.contentOffset.y > 200
    } action: { _, shouldShow in
      withAnimation {
        showScrollToTop = shouldShow
      }
    }
  }
}

#Preview {
  Step04View()
}
