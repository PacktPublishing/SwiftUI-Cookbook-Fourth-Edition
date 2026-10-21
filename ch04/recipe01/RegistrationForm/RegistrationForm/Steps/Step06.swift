//
//  Step06.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 3/25/26.
//

import SwiftUI

/// Step 6: Added Preferences, Create Account button, and form validation
/// Book recipe step: 6
struct Step06View: View {
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var birthDate = Date()
  @State private var email = ""
  @State private var phone = ""
  @State private var password = ""
  @State private var confirmPassword = ""
  @State private var bio = ""
  @State private var agreeToTerms = false
  @State private var receiveNewsletter = true

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
        Section("Preferences") {
          Toggle("I agree to the Terms", isOn: $agreeToTerms)
          Toggle("Receive Newsletter", isOn: $receiveNewsletter)
        }
        Section {
          Button("Create Account") {
            // Submit the registration
          }
          .frame(maxWidth: .infinity)
          .disabled(!isFormValid)
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

  private var isFormValid: Bool {
    !firstName.isEmpty &&
    !lastName.isEmpty &&
    !email.isEmpty &&
    !password.isEmpty &&
    password == confirmPassword &&
    agreeToTerms
  }
}

#Preview {
  Step06View()
}
