//
//  Step02.swift
//  SettingsDashboard
//
//  Created by Juan Catalan on 5/28/26.
//

import SwiftUI

/// Step 2: The panel adapts its layout: a two-column grid at standard
/// text sizes, a single vertical stack at accessibility sizes.
/// Book recipe step: 2
struct Step02View: View {
  var body: some View {
    EnvironmentInfoView()
      .padding()
  }
}

#Preview {
  Step02View()
}
