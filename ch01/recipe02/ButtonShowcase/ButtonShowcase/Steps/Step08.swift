//
//  Step08.swift
//  ButtonShowcase
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 8: Final complete app with all NavigationLinks pointing to real destination views
/// Book recipe step: 8
struct Step08View: View {
  var body: some View {
    NavigationStack {
      List {
        NavigationLink {
          ButtonStylesView()
        } label: {
          HStack(spacing: 12) {
            Image(systemName: "paintbrush.fill")
              .foregroundStyle(.blue)
            Text("Button Styles")
          }
        }
        NavigationLink {
          ButtonRolesView()
        } label: {
          HStack(spacing: 12) {
            Image(systemName: "theatermasks.fill")
              .foregroundStyle(.purple)
            Text("Roles & Tints")
          }
        }
        NavigationLink {
          ButtonShapesView()
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
  Step08View()
}
