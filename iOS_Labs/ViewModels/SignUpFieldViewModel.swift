//
//  SignUpFieldViewModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 09.11.2021.
//

import Foundation


class SignUpFieldViewModel: ObservableObject {
    let type: SignUpFieldType
    var text: String
    @Published var error: String = ""
    
    
    func validateField(type: SignUpFieldType) {
        switch type {
        case .firstName, .lastName:
            error = SignUpValidationService.errorForValidationName(text: text)
        case .email:
            error = SignUpValidationService.errorForValidationEmail(text: <#T##String#>)(text: text)
        case .phone:
            error = SignUpValidationService.errorForValidationPhone(text: <#T##String#>)(text: text)
        case .password:
            error = SignUpValidationService.errorForValidationPassword(text: <#T##String#>)(text: text)
        case .confirmation:
            error = SignUpValidationService.errorForValidationConfirmation(password: <#T##String#>, confirmation: <#T##String#>)(text: <#T##String#>)(text: text)
        }
    
        let form = SignUpModel(firstName: firstName,
                                   lastName: lastName,
                                   email: email,
                                   phone: phone,
                                   password: password,
                                   confirmation: confirmation)
        self.errors = SignUpValidationService.isFormValid(form: form)
    }
    enum Constants {
        static let invalidFirstName = "Invalid First name"
    }
    
}
