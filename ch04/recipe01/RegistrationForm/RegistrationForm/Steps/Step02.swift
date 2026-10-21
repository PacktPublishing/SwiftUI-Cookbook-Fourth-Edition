//
//  Step02.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 3/25/26.
//

import SwiftUI

/// Step 2: Added Contact section with email and phone fields
/// Book recipe step: 2
struct Step02View: View {
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthDate = Date()
  @State private var email = ""
  @State private var phone = ""

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
        Section("Contact") {
          TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .textContentType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
          TextField("Phone", text: $phone)
            .keyboardType(.phonePad)
            .textContentType(.telephoneNumber)
        }
      }
      .navigationTitle("Register")
    }
  }
}

#Preview {
  Step02View()
}
