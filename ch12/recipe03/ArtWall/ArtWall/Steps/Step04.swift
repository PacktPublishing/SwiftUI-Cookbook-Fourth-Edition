//
//  Step04.swift
//  ArtWall
//
//  Created by Juan Catalan on 8/11/26.
//

import SwiftUI

/// Step 4: The framed tile as it hangs on the wall, artwork above a caption.
/// Book recipe step: 4
struct Step04View: View {
  var body: some View {
    ArtTileView(piece: .sample, motion: .snappy, showsLabel: true)
      .padding()
  }
}

#Preview {
  Step04View()
}
