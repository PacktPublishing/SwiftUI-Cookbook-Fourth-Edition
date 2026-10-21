//
//  Step04.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 4: The card's gradient header, rounded on its top two corners only.
/// Book recipe step: 4
struct Step04View: View {
  var body: some View {
    HikeHeaderView(hike: .sample)
      .padding()
  }
}

#Preview {
  Step04View()
}
