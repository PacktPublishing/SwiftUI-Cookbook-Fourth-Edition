//
//  LedgerGenerator.swift
//  ExpenseLedger
//
//  Created by Juan Catalan on 9/8/26.
//

import Foundation

struct SeededGenerator: RandomNumberGenerator {
  private var state: UInt64

  init(seed: UInt64) {
    state = seed
  }

  mutating func next() -> UInt64 {
    state = state &* 6364136223846793005 &+ 1442695040888963407
    return state
  }
}

enum LedgerGenerator {
  static let merchants: [ExpenseCategory: [String]] = [
    .groceries: ["Fresh Market", "Corner Grocer", "Farm Stand"],
    .dining: ["Bistro 42", "Noodle House", "Cafe Aurora"],
    .transport: ["Metro Card", "City Taxi", "Fuel Stop"],
    .utilities: ["Power Co.", "City Water", "Fiber Net"],
    .entertainment: ["Cinema Plaza", "Vinyl Vault", "Game Arena"],
    .health: ["Pharmacy One", "Dental Care", "Yoga Loft"]
  ]

  static func expenses(count: Int, months: Int = 24) -> [Expense] {
    var generator = SeededGenerator(seed: 1972)
    let calendar = Calendar.current
    let endComponents = DateComponents(year: 2026, month: 8, day: 31)
    let end = calendar.date(from: endComponents) ?? .now
    let start = calendar.date(byAdding: .month, value: -months, to: end) ?? end
    let span = end.timeIntervalSince(start)
    return (1...count).map { number in
      let categories = ExpenseCategory.allCases
      let category = categories.randomElement(using: &generator) ?? .groceries
      let names = merchants[category] ?? []
      let merchant = names.randomElement(using: &generator) ?? "Unknown"
      let offset = TimeInterval.random(in: 0..<span, using: &generator)
      let amount = Double.random(in: 3...240, using: &generator)
      return Expense(id: number, date: start.addingTimeInterval(offset),
                     merchant: merchant, category: category, amount: amount)
    }
    .sorted { $0.date > $1.date }
  }
}
