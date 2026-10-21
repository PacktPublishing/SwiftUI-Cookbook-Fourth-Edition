//
//  Step07.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

/// Step 7: The complete park detail, with the navigation touches added.
/// Book recipe step: 7
struct Step07View: View {
  var body: some View {
    NavigationStack {
      ParkDetailView(park: Park.all[0])
    }
    .environment(ParkRouter())
  }
}

#Preview {
  Step07View()
}
