//
//  Step03.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

/// Step 3: The @Animatable arc on its own, held at a fixed sweep and
/// thickness. Nothing animates it yet; the brew cycle arrives in step 5.
/// Book recipe step: 3
struct Step03View: View {
  var body: some View {
    BrewArc(progress: 0.7, lineWidth: 16)
      .fill(.orange.gradient)
      .frame(width: 220, height: 220)
      .padding()
  }
}

#Preview {
  Step03View()
}
