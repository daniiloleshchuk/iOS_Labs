//
//  SignUpValidationService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 30.10.2021.
//

import Foundation


class SignUpValidationService {
    
    static public func isFormValid(form: SignUpModel) -> [String: String] {
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
        if !isConfirmationValid(password: form.password, confirmation: form.confirmation) {
            errors["confirmation"] = "Passwords don't match"
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

     static func isConfirmationValid(password: String, confirmation: String) -> Bool {
         return isPasswordValid(text: password) && (password == confirmation)
     }

 }
