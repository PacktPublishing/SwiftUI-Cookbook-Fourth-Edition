//
//  Step03.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

/// Step 3: The artwork on its own, a gradient square carrying the piece's
/// SF Symbol.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  var body: some View {
    ArtworkView(piece: .sample, symbolSize: 60)
      .padding()
  }
}

#Preview {
  Step03View()
}
