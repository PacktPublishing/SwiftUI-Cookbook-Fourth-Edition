//
//  Step06.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 6: HStack with two temperature columns nested inside the outer VStack
/// Book recipe step: 6
struct Step06View: View {
  var body: some View {
    VStack(spacing: 8) {
      Image(.cloudAndSun)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 120)
      Text("San Francisco")
        .font(.title)
        .fontWeight(.bold)
      Text("Partly Cloudy")
        .font(.subheadline)
        .foregroundStyle(.secondary)
      HStack(spacing: 16) {
        VStack {
          Text("72°")
            .font(.system(size: 44, weight: .thin))
          Text("Current")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        VStack {
          Text("68°")
            .font(.system(size: 44, weight: .thin))
          Text("Feels like")
            .font(.caption)
            .foregroundStyle(.secondary)
        }
      }
    }
    .padding()
  }
}

#Preview {
  Step06View()
}
