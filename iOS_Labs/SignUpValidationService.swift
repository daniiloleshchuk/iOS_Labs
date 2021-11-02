//
//  SignUpValidationService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 30.10.2021.
//

import Foundation


class SignUpFormValidationService {
    
    static public func isFormValid(form: SignUpFormModel) -> [String: String] {
        var errors = [String: String]()

        if form.firstName.isEmpty {
            errors["firstName"] = "Invalid first name"
        }
        if form.lastName.isEmpty {
            errors["lastName"] = "Invalid last name"
        }
        if !isEmailValid(text: form.email) {
            errors["email"] = "Invalid email"
        }
        if !isPhoneValid(text: form.phone) {
            errors["phone"] = "Invalid phone"
        }
        if !isPasswordValid(text: form.password) {
            errors["password"] = "Password should have at least 8 symbols"
        }
        if !isPasswordConfirmationValid(password: form.password, passwordConfirmation: form.passwordConfirmation) {
            errors["passwordConfirmation"] = "Passwords don't match"
        }

        return errors
     }

     static private func isEmailValid(text: String) -> Bool {
         let emailRegex = "[a-zA-Z0-9\\-]+@[a-zA-Z0-9\\-]+\\.[a-zA-Z]{2,10}"
         return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: text)
     }

     static private func isPhoneValid(text: String) -> Bool {
         let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
         return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: text)
     }

     static private func isPasswordValid(text: String) -> Bool {
         return text.count >= 8
     }

     static func isPasswordConfirmationValid(password: String, passwordConfirmation: String) -> Bool {
         return isPasswordValid(text: password) && (password == passwordConfirmation)
     }

 }
