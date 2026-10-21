//
//  LedgerMonth.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import Foundation

struct LedgerRow: Identifiable, Equatable {
  let id: Int
  let merchant: String
  let symbolName: String
  let dateText: String
  let amountText: String
  let shareText: String
}

struct LedgerMonth: Identifiable, Equatable {
  let id: Date
  let title: String
  let totalText: String
  let rows: [LedgerRow]
}

extension LedgerRow {
  static let sample = LedgerRow(
    id: 1,
    merchant: "Fresh Market",
    symbolName: "cart",
    dateText: "Aug 30, 2026",
    amountText: "$42.10",
    shareText: "3.2%"
  )
}
