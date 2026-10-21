//
//  Step04.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 3/25/26.
//

import SwiftUI

/// Step 4: Added About You section with multiline TextField
/// Book recipe step: 4
struct Step04View: View {
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthDate = Date()
  @State private var email = ""
  @State private var phone = ""
  @State private var password = ""
  @State private var confirmPassword = ""
  @State private var bio = ""

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
        Section("About You") {
          TextField("Short bio", text: $bio, axis: .vertical)
            .lineLimit(3...6)
        }
      }
      .navigationTitle("Register")
    }
  }
}

#Preview {
  Step04View()
}
