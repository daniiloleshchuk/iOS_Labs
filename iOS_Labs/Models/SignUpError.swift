//
//  SignUpError.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.11.2021.
//

import Foundation

enum SignUpError {
    static let firstName = "First name is empty"
    static let lastName = "Last name is empty"
    static let email = "Email seems to be invalid"
    static let phone = "Phone seems to be invalid"
    static let password = "Password should have at least 8 symbols"
    static let confirmation = "Passwords don't match"
    static let `default` = "Form is invalid"
}
