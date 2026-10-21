//
//  Step05.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 5: Added spacing parameter and padding modifier
/// Book recipe step: 5
struct Step05View: View {
  var body: some View {
    VStack(spacing: 8) {
      Image(.cloudAndSun)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 120)
      Text("San Francisco")
        .font(.title)
        .fontWeight(.bold)
      Text("Partly Cloudy")
        .font(.subheadline)
        .foregroundStyle(.secondary)
    }
    .padding()
  }
}

#Preview {
  Step05View()
}
