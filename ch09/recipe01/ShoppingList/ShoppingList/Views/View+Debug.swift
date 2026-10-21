//
//  View+Debug.swift
//  ShoppingList
//
//  Created by Juan Catalan on 8/30/26.
//

import SwiftUI

extension View {
  func debugBackground() -> some View {
    #if DEBUG
    background(Color(hue: .random(in: 0...1), saturation: 0.6,
                     brightness: 1, opacity: 0.35))
    #else
    self
    #endif
  }
}
