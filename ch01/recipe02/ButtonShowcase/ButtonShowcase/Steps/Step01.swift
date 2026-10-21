//
//  Step01.swift
//  ButtonShowcase
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 1: NavigationStack with List and three NavigationLinks using placeholder destinations
/// Book recipe step: 1
struct Step01View: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink {
          Text("Coming soon")
        } label: {
          HStack(spacing: 12) {
            Image(systemName: "paintbrush.fill")
              .foregroundStyle(.blue)
            Text("Button Styles")
          }
        }
        NavigationLink {
          Text("Coming soon")
        } label: {
          HStack(spacing: 12) {
            Image(systemName: "theatermasks.fill")
              .foregroundStyle(.purple)
            Text("Roles & Tints")
          }
        }
        NavigationLink {
          Text("Coming soon")
        } label: {
          HStack(spacing: 12) {
            Image(systemName: "square.on.circle")
              .foregroundStyle(.orange)
            Text("Border Shapes")
          }
        }
      }
      .navigationTitle("Buttons & Nav")
    }
  }
}

#Preview {
  Step01View()
}
