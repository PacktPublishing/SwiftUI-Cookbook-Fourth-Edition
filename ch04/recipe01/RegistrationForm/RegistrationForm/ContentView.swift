//
//  ContentView.swift
//  RegistrationForm
//
//  Created by Juan Catalan on 6/19/26.
//

import SwiftUI

struct ContentView: View {
  enum Field: Int {
    case firstName = 0
    case lastName
    case email
    case phone
    case password
    case confirmPassword
    case bio

    var next: Field? {
      Field(rawValue: rawValue + 1)
    }

    var previous: Field? {
      Field(rawValue: rawValue - 1)
    }
  }

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
  @FocusState private var focusedField: Field?

  var body: some View {
    NavigationStack {
      Form {
        Group {
          Section("Personal Information") {
            TextField("First Name", text: $firstName)
              .textContentType(.givenName)
              .focused($focusedField, equals: .firstName)

            TextField("Last Name", text: $lastName)
              .textContentType(.familyName)
              .focused($focusedField, equals: .lastName)

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
              .focused($focusedField, equals: .email)

            TextField("Phone", text: $phone)
              .keyboardType(.phonePad)
              .textContentType(.telephoneNumber)
              .focused($focusedField, equals: .phone)
          }

          Section {
            SecureField("Password", text: $password)
              .textContentType(.newPassword)
              .focused($focusedField, equals: .password)

            SecureField("Confirm Password", text: $confirmPassword)
              .textContentType(.newPassword)
              .focused($focusedField, equals: .confirmPassword)
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
        .submitLabel(.next)

        Section("About You") {
          TextField("Short bio", text: $bio, axis: .vertical)
            .lineLimit(3...6)
            .focused($focusedField, equals: .bio)
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
      .onSubmit {
        moveToNextField()
      }
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Button(action: moveToPreviousField) {
            Image(systemName: "chevron.up")
          }
          .disabled(focusedField == .firstName)
          Button(action: moveToNextField) {
            Image(systemName: "chevron.down")
          }
          .disabled(focusedField == .bio)
          Spacer()
          Button(action: { focusedField = nil } ) {
            Image(systemName: "keyboard.chevron.compact.down")
          }
        }
      }
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

  private func moveToNextField() {
    guard let current = focusedField else { return }
    focusedField = current.next
  }

  private func moveToPreviousField() {
    guard let current = focusedField else { return }
    focusedField = current.previous
  }
}

#Preview {
  ContentView()
}
