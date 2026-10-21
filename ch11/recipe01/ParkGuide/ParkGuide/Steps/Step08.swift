//
//  Step08.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

/// Step 8: The park grid, with value-based links and zoom sources.
/// Book recipe step: 8
struct Step08View: View {
  @Namespace private var namespace

  var body: some View {
    NavigationStack {
      ParkGridView(
        title: "West",
        parks: Park.inRegion(.west),
        namespace: namespace
      )
      .navigationDestination(for: Park.self) { park in
        ParkDetailView(park: park)
      }
    }
    .environment(ParkRouter())
  }
}

#Preview {
  Step08View()
}
