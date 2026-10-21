//
//  Step02.swift
//  PantryChef
//
//  Created by Juan Catalan on 9/21/26.
//

import SwiftUI

/// Step 2: The pantry list, with a section for each shelf and swipe to
/// delete, inside the navigation stack its preview provides.
/// Book recipe steps: 1, 2
struct Step02View: View {
  var body: some View {
    NavigationStack {
      PantryView(pantry: Pantry())
    }
  }
}

#Preview {
  Step02View()
}
