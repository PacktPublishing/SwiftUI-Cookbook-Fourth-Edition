//
//  Step11.swift
//  ActivityTrends
//
//  Created by Juan Catalan on 8/19/26.
//

import SwiftUI

/// Step 11: The finished app, with both charts sharing the range and
/// the selection.
/// Book recipe steps: 10, 11
struct Step11View: View {
  var body: some View {
    ContentView(selectedDate: DailyActivity.all[103].date)
  }
}

#Preview {
  Step11View()
}
