//
//  SignUpModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 30.10.2021.
//

import Foundation


class SignUpViewModel: ObservableObject {
    @Published var fields = getDefaultedForm()
    
    private static func getDefaultedForm() -> [SignUpFieldModel] {
        [
            SignUpFieldModel(label: Constants.firstNameLabel, type: .firstName, isSecured: false),
            SignUpFieldModel(label: Constants.lastNameLabel, type: .lastName, isSecured: false),
            SignUpFieldModel(label: Constants.emailLabel, type: .email, isSecured: false),
            SignUpFieldModel(label: Constants.phoneLabel, type: .phone, isSecured: false),
            SignUpFieldModel(label: Constants.passwordLabel, type: .password, isSecured: true),
            SignUpFieldModel(label: Constants.confirmationLabel, type: .confirmation, isSecured: true),
        ]
    }

    func getField(byType type: SignUpFieldType) -> SignUpFieldModel {
        fields.first { field in field.type == type }!
    }
    
    enum Constants {
        static let firstNameLabel = "First name"
        static let lastNameLabel = "Last name"
        static let emailLabel = "Email"
        static let phoneLabel = "Phone"
        static let passwordLabel = "Password"
        static let confirmationLabel = "Password confirmation"
    }
}
