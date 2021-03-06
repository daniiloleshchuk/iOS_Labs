//
//  SignUpValidationService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 30.10.2021.
//

import Foundation


class SignUpValidationService {
    static func vaildateForm(form: SignUpViewModel) -> [SignUpFieldType: String] {
        var errors = [SignUpFieldType: String]()
        for (_, field) in form.fields.enumerated() {
            if let error = fieldError(field: field) {
                errors[field.type] = error
            }
        }
        return errors
    }

    static func fieldError(field: SignUpFieldModel) -> String? {
        switch field.type {
            case .firstName, .lastName:
                if (field.value.isEmpty) {
                    return field.type.errorText()
                }
            case .email, .phone, .password:
                if (!isTextValid(text: field.value, regex: field.type.regExp())) {
                    return field.type.errorText()
                }
            default:
                return nil
        }
        return nil;
    }

    static func isConfirmationValid(password: String, confirmation: String) -> Bool {
        return !password.isEmpty && (password == confirmation)
    }

    static func isTextValid(text: String, regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
    }
}
