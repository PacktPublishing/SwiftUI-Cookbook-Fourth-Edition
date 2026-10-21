//
//  Step01.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 1: Basic VStack with two Text views
/// Book recipe step: 1
struct Step01View: View {
  var body: some View {
    VStack {
      Text("San Francisco")
      Text("Partly Cloudy")
    }
  }
}

#Preview {
  Step01View()
}
