//
//  ExpenseRowView.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import SwiftUI

struct ExpenseRowView: View {
  let row: LedgerRow

  var body: some View {
    HStack {
      Image(systemName: row.symbolName)
        .frame(width: 28)
        .foregroundStyle(.tint)
      VStack(alignment: .leading) {
        Text(row.merchant)
        Text(row.dateText)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
      Spacer()
      VStack(alignment: .trailing) {
        Text(row.amountText)
          .monospacedDigit()
        Text(row.shareText)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview {
  List {
    ExpenseRowView(row: .sample)
  }
}
