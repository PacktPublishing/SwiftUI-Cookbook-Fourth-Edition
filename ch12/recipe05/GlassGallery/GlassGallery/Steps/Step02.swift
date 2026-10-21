//
//  Step02.swift
//  GlassGallery
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 2: The mesh artwork on its own, extended under the safe area. Nothing
/// floats over it yet, so this is the surface the glass will refract.
/// Book recipe steps: 1, 2
struct Step02View: View {
  var body: some View {
    ArtworkBackdropView(artwork: Artwork.all[0])
  }
}

#Preview {
  Step02View()
}
