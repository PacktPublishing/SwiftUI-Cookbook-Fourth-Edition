//
//  Step02.swift
//  AlertShowcase
//
//  Created by Juan Catalan on 3/27/26.
//

import SwiftUI

/// Step 2: Added destructive delete alert with button roles
/// Book recipe step: 2
struct Step02View: View {
  @State private var showWelcome = false
  @State private var showDelete = false
  @State private var itemName = "My Document"
  @State private var message = "Tap a button to see an alert or dialog."

  var body: some View {
    NavigationStack {
      VStack(spacing: 32) {
        Text(itemName)
          .font(.title)
          .fontWeight(.bold)
        Text(message)
          .font(.headline)
          .foregroundStyle(.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal)
        VStack(spacing: 16) {
          Button("Show Welcome Alert") {
            showWelcome = true
          }
          .buttonStyle(.bordered)
          Button("Delete Item", role: .destructive) {
            showDelete = true
          }
          .buttonStyle(.bordered)
        }
        Spacer()
      }
      .padding(.top, 48)
      .padding(.horizontal, 8)
      .navigationTitle("Alerts & Dialogs")
      .alert("Welcome!", isPresented: $showWelcome) {
        Button("OK") {
          message = "You dismissed the welcome alert."
        }
      } message: {
        Text("This is a simple informational alert with a single button.")
      }
      .alert("Delete Item?", isPresented: $showDelete) {
        Button("Delete", role: .destructive) {
          message = "Item deleted."
        }
        Button("Cancel", role: .cancel) { }
      } message: {
        Text("This action cannot be undone. " +
             "The item will be permanently removed.")
      }
    }
  }
}

#Preview {
  Step02View()
}
