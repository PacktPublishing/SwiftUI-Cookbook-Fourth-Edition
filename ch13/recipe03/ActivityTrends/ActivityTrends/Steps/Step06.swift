//
//  Step06.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 6: The selection card on its own.
/// Book recipe step: 6
struct Step06View: View {
  var body: some View {
    SelectionCard(activity: DailyActivity.all[103])
  }
}

#Preview {
  Step06View()
}
