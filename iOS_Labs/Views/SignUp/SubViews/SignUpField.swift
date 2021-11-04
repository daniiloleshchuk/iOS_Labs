//
//  SignUpField.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.11.2021.
//

import SwiftUI

struct SignUpField: View {
    var placeholder: String
    var error: String
    var text: Binding<String>

    var body: some View {
        if placeholder.lowercased().contains(Constants.password) {
            SecureField(placeholder, text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } else if placeholder.lowercased().contains(Constants.phone) {
            TextField(placeholder, text: text)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } else if placeholder.lowercased().contains(Constants.email) {
            TextField(placeholder, text: text)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } else {
            TextField(placeholder, text: text)
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

struct SignUpField_Previews: PreviewProvider {
    static var previews: some View {
        SignUpField(placeholder: Constants.placeholder,
                    error: Constants.error,
                    text: .constant(Constants.text))
    }
    enum Constants {
        static let placeholder = "Name"
        static let error = "missing name"
        static let text = "text"
    }
}
