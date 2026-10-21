//
//  Step08.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 8: The finished chart, with the filled area, baseline, and well.
/// Book recipe step: 8
struct Step08View: View {
  var body: some View {
    ElevationProfileView(samples: Hike.sample.elevationSamples)
      .padding()
  }
}

#Preview {
  Step08View()
}
