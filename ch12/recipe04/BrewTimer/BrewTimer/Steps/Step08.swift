//
//  Step08.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 8: The drop on its own, held at one point of the pour rather than
/// animated. Nothing drives PourValues yet, so the values are supplied by hand.
/// Book recipe steps: 6, 7, 8
struct Step08View: View {
  var body: some View {
    DropletView(values: PourValues(drop: 0, squash: 1, opacity: 1))
      .padding()
  }
}

#Preview {
  Step08View()
}
