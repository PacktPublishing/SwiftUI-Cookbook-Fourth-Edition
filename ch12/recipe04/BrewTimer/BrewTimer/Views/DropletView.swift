//
//  DropletView.swift
//  BrewTimer
//
//  Created by Juan Catalan on 8/13/26.
//

import SwiftUI

struct DropletView: View {
  let values: PourValues

  var body: some View {
    Circle()
      .fill(.blue.gradient)
      .frame(width: 20, height: 20)
      .scaleEffect(x: 2 - values.squash, y: values.squash)
      .opacity(values.opacity)
      .offset(y: values.drop)
  }
}

#Preview {
  DropletView(values: PourValues(drop: 0, squash: 1, opacity: 1))
    .padding()
}
