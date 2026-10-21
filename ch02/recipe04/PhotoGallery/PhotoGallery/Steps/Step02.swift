//
//  Step02.swift
//  PhotoGallery
//
//  Created by Juan Catalan on 7/2/26.
//

import SwiftUI

/// Step 2: View structure with Text placeholders
/// Book recipe step: 2
struct Step02View: View {
  @State private var photos = Photo.samples
  @State private var scrolledID: Int?
  @State private var isScrolling = false
  @State private var showScrollToTop = false
  @State private var position = ScrollPosition(edge: .top)

  var body: some View {
    NavigationStack {
      VStack(spacing: 0) {
        Text("Carousel")
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
}

#Preview {
  Step02View()
}
