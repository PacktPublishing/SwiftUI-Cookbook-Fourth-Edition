//
//  Step05.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 3/25/26.
//

import SwiftUI

/// Step 5: Added Account Preview section with LabeledContent
/// Book recipe step: 5
struct Step05View: View {
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
        Section("Account Preview") {
          LabeledContent("Full Name", value: fullName)
          LabeledContent("Account Type", value: "Standard")
        }
      }
      .navigationTitle("Register")
    }
  }

  private var fullName: String {
    let name = (firstName + " " +
                lastName).trimmingCharacters(in:.whitespaces)
    return name.isEmpty ? "—" : name
  }
}

#Preview {
  Step05View()
}
