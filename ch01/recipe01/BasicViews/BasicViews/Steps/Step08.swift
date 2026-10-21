//
//  Step08.swift
//  BasicViews
//
//  Created by Juan Catalan on 2/28/26.
//

import SwiftUI

/// Step 8: Added Divider between city info and temperature row, three columns with Spacers
/// Book recipe steps: 7, 8
struct Step08View: View {
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
  }
}

#Preview {
  Step08View()
}
