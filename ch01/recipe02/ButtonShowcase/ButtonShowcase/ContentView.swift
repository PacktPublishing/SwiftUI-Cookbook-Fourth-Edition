//
//  ContentView.swift
//  ButtonShowcase
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

struct ContentView: View {
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
  ContentView()
}
