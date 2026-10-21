//
//  ParkDetailView.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

struct ParkDetailView: View {
  let park: Park
  @Environment(ParkRouter.self) private var router

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        header
        facts
        highlights
        exploreButton
      }
      .padding()
    }
    .navigationTitle(park.name)
    .navigationBarTitleDisplayMode(.inline)
    .navigationDocument(park.url)
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        Button("All Parks", systemImage: "list.bullet") {
          router.popToRoot()
        }
      }
    }
  }

  private var header: some View {
    VStack(spacing: 12) {
      Image(systemName: park.symbolName)
        .font(.system(size: 64))
      Text(park.tagline)
        .font(.headline)
        .multilineTextAlignment(.center)
    }
    .foregroundStyle(.white)
    .frame(maxWidth: .infinity)
    .padding(.vertical, 48)
    .background(park.region.tint.gradient, in: .rect(cornerRadius: 20))
  }

  private var facts: some View {
    HStack {
      Label("Est. \(park.establishedText)", systemImage: "calendar")
      Spacer()
      Label(park.areaFormatted, systemImage: "ruler")
    }
    .font(.subheadline)
    .foregroundStyle(.secondary)
  }

  private var highlights: some View {
    VStack(alignment: .leading) {
      Text("Highlights")
        .font(.title2)
        .fontWeight(.bold)
      ForEach(park.highlights, id: \.self) { highlight in
        Label(highlight, systemImage: "checkmark.circle.fill")
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  private var exploreButton: some View {
    Button {
      router.show(park.region)
    } label: {
      Label("More parks in \(park.region.rawValue)", systemImage: "map")
        .frame(maxWidth: .infinity)
    }
    .buttonStyle(.bordered)
  }
}

#Preview {
  NavigationStack {
    ParkDetailView(park: Park.all[0])
  }
  .environment(ParkRouter())
}
