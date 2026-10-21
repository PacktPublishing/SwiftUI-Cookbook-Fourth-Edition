//
//  ParkCardView.swift
//  ParkGuide
//
//  Created by Juan Catalan on 7/19/26.
//

import SwiftUI

struct ParkCardView: View {
  let park: Park

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Image(systemName: park.symbolName)
          .font(.system(size: 36))
        Spacer()
        if park.isFavorite {
          Image(systemName: "star.fill")
        }
      }
      Spacer(minLength: 0)
      Text(park.name)
        .font(.headline)
      Text(park.tagline)
        .font(.caption)
        .lineLimit(2)
    }
    .foregroundStyle(.white)
    .padding()
    .frame(height: 150, alignment: .topLeading)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(park.region.tint.gradient, in: .rect(cornerRadius: 16))
  }
}

#Preview {
  ParkCardView(park: Park.all[0])
    .padding()
}
