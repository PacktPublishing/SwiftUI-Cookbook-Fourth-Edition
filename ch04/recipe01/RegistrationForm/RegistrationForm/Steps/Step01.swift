//
//  Step01.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 3/25/26.
//

import SwiftUI

/// Step 1: Basic form with Personal Information section
/// Book recipe step: 1
struct Step01View: View {
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthDate = Date()

  var body: some View {
    NavigationStack {
      Form {
        Section("Personal Information") {
          TextField("First Name", text: $firstName)
          TextField("Last Name", text: $lastName)
          DatePicker("Date of Birth",
                     selection: $birthDate,
                     in: ...Date.now,
                     displayedComponents: .date)
        }
      }
      .navigationTitle("Register")
    }
  }
}

#Preview {
  Step01View()
}
