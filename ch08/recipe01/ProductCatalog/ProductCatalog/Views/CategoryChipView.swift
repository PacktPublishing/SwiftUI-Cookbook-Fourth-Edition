//
//  CategoryChipView.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

struct CategoryChipView: View {
  let title: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.caption)
        .fontWeight(isSelected ? .semibold : .regular)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .foregroundStyle(isSelected ? .white : .primary)
        .background(isSelected ? Color.blue : Color.gray.opacity(0.15))
        .clipShape(Capsule())
    }
    .buttonStyle(.plain)
  }
}

#Preview {
  HStack {
    CategoryChipView(title: "All", isSelected: true) {}
    CategoryChipView(title: "Books", isSelected: false) {}
  }
  .padding()
}
