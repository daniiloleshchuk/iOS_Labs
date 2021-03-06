//
//  SignUpField.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.11.2021.
//

import SwiftUI

struct SignUpField: View {
    @State var field: SignUpFieldModel
    @Binding var error: String?
    
    var body: some View {
        if (!field.isSecured) {
            TextField(field.label, text: self.$field.value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } else {
            SecureField(field.label, text: self.$field.value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Text(error ?? Constants.emptyError)
            .foregroundColor(.red)
    }
    enum Constants {
        static let emptyError = ""
    }
}

struct SignUpField_Previews: PreviewProvider {
    static var previews: some View {
        SignUpField(field: SignUpFieldModel(label: Constants.firstNameLabel,
                                            type: .firstName,
                                            isSecured: false),
                    error: .constant(Constants.error))
    }
    enum Constants {
        static let firstNameLabel = "First name"
        static let error = "error"
    }
}
