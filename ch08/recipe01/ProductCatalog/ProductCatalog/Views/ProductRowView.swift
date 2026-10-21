//
//  ProductRowView.swift
//  ProductCatalog
//
//  Created by Juan Catalan on 7/6/26.
//

import SwiftUI

struct ProductRowView: View {
  let product: Product

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      header
      Text(product.description)
        .font(.caption)
        .foregroundStyle(.secondary)
        .lineLimit(2)
      detailRow
      tagList
      availability
    }
    .padding(.vertical, 4)
  }

  private var header: some View {
    HStack {
      Text(product.name)
        .font(.headline)
      Spacer()
      Text(product.price, format: .currency(code: "USD"))
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundStyle(product.isAvailable ? .primary : .secondary)
    }
  }

  private var detailRow: some View {
    HStack {
      Label(product.category.rawValue.capitalized,
            systemImage: product.category.symbolName)
        .font(.caption2)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(.blue.opacity(0.1))
        .clipShape(Capsule())
      Spacer()
      HStack(spacing: 2) {
        Image(systemName: "star.fill")
          .foregroundStyle(.yellow)
        Text(product.rating, format: .number.precision(.fractionLength(1)))
        Text("(\(product.reviewCount))")
          .foregroundStyle(.secondary)
      }
      .font(.caption)
      Text(product.releaseDate, format: .dateTime.month(.abbreviated).year())
        .font(.caption2)
        .foregroundStyle(.secondary)
    }
  }

  @ViewBuilder
  private var tagList: some View {
    if !product.tags.isEmpty {
      HStack {
        ForEach(product.tags, id: \.self) { tag in
          Text(tag)
            .font(.caption2)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(.gray.opacity(0.15))
            .clipShape(Capsule())
        }
      }
    }
  }

  @ViewBuilder
  private var availability: some View {
    if !product.isAvailable {
      Text("Out of Stock")
        .font(.caption)
        .fontWeight(.medium)
        .foregroundStyle(.red)
    }
  }
}

#Preview {
  List {
    ProductRowView(product: .preview)
  }
  .listStyle(.plain)
}
