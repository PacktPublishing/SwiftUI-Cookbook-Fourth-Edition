//
//  Step06.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 6: The rings with their legend alongside.
/// Book recipe step: 6
struct Step06View: View {
  var body: some View {
    ProgressRingsView(hike: .sample)
      .padding()
  }
}

#Preview {
  Step06View()
}
