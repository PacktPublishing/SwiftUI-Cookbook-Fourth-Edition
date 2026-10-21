//
//  Step03.swift
//  TrailStats
//
//  Created by Juan Catalan on 8/8/26.
//

import SwiftUI

/// Step 3: The progress arc, the custom shape both rings are made of.
/// Book recipe steps: 1, 2, 3
struct Step03View: View {
  var body: some View {
    ProgressArc(progress: 0.7)
      .stroke(.teal, style: StrokeStyle(lineWidth: 16, lineCap: .round))
      .padding(8)
      .frame(width: 144, height: 144)
  }
}

#Preview {
  Step03View()
}
