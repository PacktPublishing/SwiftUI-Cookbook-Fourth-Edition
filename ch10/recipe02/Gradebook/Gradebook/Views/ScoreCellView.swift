//
//  ScoreCellView.swift
//  Gradebook
//
//  Created by Juan Catalan on 7/10/26.
//

import SwiftUI

struct ScoreCellView: View {
  @Binding var score: Int
  var focus: FocusState<ScoreFocus?>.Binding
  let field: ScoreFocus
  var alignment: TextAlignment = .trailing

  private var color: Color {
    switch score {
    case 90...: .green
    case 80..<90: .blue
    case 70..<80: .orange
    default: .red
    }
  }

  var body: some View {
    TextField("Score", value: $score, format: .number)
      .font(.body.monospacedDigit())
      .foregroundStyle(color)
      .multilineTextAlignment(alignment)
      .frame(minWidth: 40)
      .focused(focus, equals: field)
  }
}

#Preview {
  @Previewable @State var score = 88
  @Previewable @FocusState var focus: ScoreFocus?
  ScoreCellView(
    score: $score,
    focus: $focus,
    field: ScoreFocus(student: UUID(), field: .math)
  )
  .frame(width: 120)
}
