//
//  DailyActivity.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
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

struct DailyActivity: Identifiable {
  let date: Date
  let steps: Int
  let activeMinutes: Int

  var id: Date { date }
}

extension DailyActivity {
  static let lastDay =
    DateComponents(calendar: .current, year: 2026, month: 6, day: 30).date
    ?? .now

  static let windowLength: TimeInterval = 3600 * 24 * 30

  static var lastMonthStart: Date {
    lastDay.addingTimeInterval(-windowLength)
  }

  static let all: [DailyActivity] = {
    var generator = SeededGenerator(seed: 1972)
    return (0..<120).reversed().map { offset in
      let date =
        Calendar.current.date(byAdding: .day, value: -offset, to: lastDay)
        ?? lastDay
      let weekday = Calendar.current.component(.weekday, from: date)
      let isWeekend = weekday == 1 || weekday == 7
      let average = isWeekend ? 6000.0 : 10000.0
      let range = 0.85...1.15
      let steps = average * Double.random(in: range, using: &generator)
      let minutes = steps / 150 * Double.random(in: range, using: &generator)
      return DailyActivity(date: date, steps: Int(steps),
                           activeMinutes: Int(minutes))
    }
  }()
}
