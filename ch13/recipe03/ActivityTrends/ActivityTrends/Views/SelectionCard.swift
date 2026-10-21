//
//  SelectionCard.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

struct SelectionCard: View {
  let activity: DailyActivity

  var body: some View {
    VStack(alignment: .leading, spacing: 2) {
      Text(activity.date, format: .dateTime.weekday(.abbreviated).month().day())
        .font(.caption2)
        .foregroundStyle(.secondary)
      Text("\(activity.steps.formatted()) steps")
        .font(.caption)
        .fontWeight(.semibold)
      Text("\(activity.activeMinutes.formatted()) active minutes")
        .font(.caption2)
        .foregroundStyle(.secondary)
    }
    .padding(8)
    .background(.background, in: .rect(cornerRadius: 8))
    .shadow(radius: 2)
  }
}

#Preview {
  SelectionCard(activity: DailyActivity.all[60])
}
