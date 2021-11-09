//
//  SignUpField.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.11.2021.
//

import SwiftUI

struct SignUpField: View {
    let type: SignUpFieldType
    var error: Binding<String>
    var text: Binding<String>

    var body: some View {
        switch type {
        case .firstName, .lastName:
            TextField(type.placeholder(), text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        case .email:
            TextField(type.placeholder(), text: text)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        case .phone:
            TextField(type.placeholder(), text: text)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        case .password, .confirmation:
            SecureField(type.placeholder(), text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Text(error)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    enum Constants {
        static let password = "password"
        static let phone = "phone"
        static let email = "email"
    }
}

enum SignUpFieldType {
    case firstName, lastName, email, phone, password, confirmation
    
    func placeholder() -> String {
        switch self {
        case .firstName:
            return Constants.firstNamePlaceholder
        case .lastName:
            return Constants.lastNamePlaceholder
        case .email:
            return Constants.emailPlaceholder
        case .phone:
            return Constants.phonePlaceholder
        case .password:
            return Constants.passwordPlaceholder
        case .confirmation:
            return Constants.confirmationPlaceholder
        }
    }
    
    enum Constants {
        static let firstNamePlaceholder = "First name"
        static let lastNamePlaceholder = "Last name"
        static let emailPlaceholder = "Email"
        static let phonePlaceholder = "Phone"
        static let passwordPlaceholder = "Password"
        static let confirmationPlaceholder = "Password confirmation"
    }
}

struct SignUpField_Previews: PreviewProvider {
    static var previews: some View {
        SignUpField(type: .firstName,
                    error: Constants.error,
                    text: .constant(Constants.text))
    }
    enum Constants {
        static let placeholder = "Name"
        static let error = "missing name"
        static let text = "text"
    }
}
