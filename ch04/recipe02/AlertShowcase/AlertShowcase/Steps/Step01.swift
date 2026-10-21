//
//  Step01.swift
//  AlertShowcase
//
//  Created by Juan Catalan on 3/27/26.
//

import SwiftUI

/// Step 1: Basic welcome alert with a single OK button
/// Book recipe step: 1
struct Step01View: View {
  @State private var showWelcome = false
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
    }
  }
}

#Preview {
  Step01View()
}
