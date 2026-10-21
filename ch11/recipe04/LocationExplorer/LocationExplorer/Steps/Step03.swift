//
//  Step03.swift
//  LocationExplorer
//
//  Created by Juan Catalan on 8/3/26.
//

import SwiftUI
import MapKit

/// Step 3: The map with a marker for each landmark, before any sheet.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  private let landmarks = Landmark.samples
  @State private var selected: Landmark?

  var body: some View {
    Map(initialPosition: .region(Self.bayArea), selection: $selected) {
      ForEach(landmarks) { landmark in
        Marker(landmark.name, coordinate: landmark.coordinate)
          .tag(landmark)
      }
    }
  }

  private static let bayArea = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 37.818, longitude: -122.442),
    span: MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.14)
  )
}

#Preview {
  Step03View()
}
