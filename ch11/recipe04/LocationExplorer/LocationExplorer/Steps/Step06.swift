//
//  Step06.swift
//  LocationExplorer
//
//  Created by Juan Catalan on 8/3/26.
//

import SwiftUI
import MapKit

/// Step 6: Detents, grabber, and corner radius turn the sheet into a drawer.
/// Book recipe steps: 5, 6
struct Step06View: View {
  private let landmarks = Landmark.samples
  @State private var selected: Landmark?

  private var isShowingDetail: Binding<Bool> {
    Binding(get: { selected != nil }, set: { if !$0 { selected = nil } })
  }

  var body: some View {
    Map(initialPosition: .region(Self.bayArea), selection: $selected) {
      ForEach(landmarks) { landmark in
        Marker(landmark.name, coordinate: landmark.coordinate)
          .tag(landmark)
      }
    }
    .sheet(isPresented: isShowingDetail) {
      if let landmark = selected {
        LandmarkDetailView(landmark: landmark)
          .presentationDetents([.height(140), .medium, .large])
          .presentationDragIndicator(.visible)
          .presentationCornerRadius(28)
      }
    }
  }

  private static let bayArea = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 37.818, longitude: -122.442),
    span: MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.14)
  )
}

#Preview {
  Step06View()
}
