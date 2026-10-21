//
//  ContentView.swift
//  SkyChart
//
//  Created by Juan Catalan on 8/9/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      SkyCanvasView()
        .ignoresSafeArea()
        .navigationTitle("Tonight's Sky")
        .navigationBarTitleDisplayMode(.inline)
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  ContentView()
}
