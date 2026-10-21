//
//  Step04.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 4: Added asset catalog image above styled text
/// Book recipe step: 4
struct Step04View: View {
  var body: some View {
    VStack {
      Image("cloud and sun")
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
  }
}

#Preview {
  Step04View()
}
