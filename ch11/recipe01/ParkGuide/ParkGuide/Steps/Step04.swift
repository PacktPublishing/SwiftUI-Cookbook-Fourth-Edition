//
//  Step04.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

/// Step 4: The park card, the tile the grid repeats.
/// Book recipe step: 4
struct Step04View: View {
  var body: some View {
    ParkCardView(park: Park.all[0])
      .padding()
  }
}

#Preview {
  Step04View()
}
