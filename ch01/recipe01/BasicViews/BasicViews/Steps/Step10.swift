//
//  Step10.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 10: Final weather card with gradient header, nested ZStacks, and grouped background
/// Book recipe step: 10
struct Step10View: View {
  var body: some View {
    ZStack {
      Color(.systemGroupedBackground)
        .ignoresSafeArea()
      VStack(spacing: 8) {
        ZStack(alignment: .bottomTrailing) {
          ZStack {
            LinearGradient(
              colors: [.blue, .cyan],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
            .frame(height: 140)
            .clipShape(
              UnevenRoundedRectangle(
                topLeadingRadius: 20,
                topTrailingRadius: 20
              )
            )
            Image(.cloudAndSun)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 120)
              .shadow(radius: 3)
          }
          Image(systemName: "location.fill")
            .font(.caption)
            .foregroundStyle(.white.opacity(0.8))
            .padding(10)
        }
        Text("San Francisco")
          .font(.title)
          .fontWeight(.bold)
        Text("Partly Cloudy")
          .font(.subheadline)
          .foregroundStyle(.secondary)
        Divider()
        HStack {
          VStack {
            Text("58°")
              .font(.system(size: 44, weight: .thin))
            Text("Low")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
          Spacer()
          VStack {
            Text("72°")
              .font(.system(size: 44, weight: .thin))
            Text("Current")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
          Spacer()
          VStack {
            Text("79°")
              .font(.system(size: 44, weight: .thin))
            Text("High")
              .font(.caption)
              .foregroundStyle(.secondary)
          }
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
      }
      .background {
        RoundedRectangle(cornerRadius: 20)
          .fill(Color(.systemBackground))
          .shadow(color: .black.opacity(0.15),
                  radius: 10, x: 0, y: 5)
      }
      .padding(.horizontal, 24)
    }
  }
}

#Preview {
  Step10View()
}
