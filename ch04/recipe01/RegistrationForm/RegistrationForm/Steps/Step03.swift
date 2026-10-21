//
//  Step03.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 3/25/26.
//

import SwiftUI

/// Step 3: Added Security section with password fields and validation footer
/// Book recipe step: 3
struct Step03View: View {
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthDate = Date()
  @State private var email = ""
  @State private var phone = ""
  @State private var password = ""
  @State private var confirmPassword = ""

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
        Section {
          SecureField("Password", text: $password)
            .textContentType(.newPassword)
          SecureField("Confirm Password", text: $confirmPassword)
            .textContentType(.newPassword)
        } header: {
          Text("Security")
        } footer: {
          if !password.isEmpty && !confirmPassword.isEmpty
              && password != confirmPassword {
            Text("Passwords do not match")
              .foregroundStyle(.red)
          }
        }
      }
      .navigationTitle("Register")
    }
  }
}

#Preview {
  Step03View()
}
