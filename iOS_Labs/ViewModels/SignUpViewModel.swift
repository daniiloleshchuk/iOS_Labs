//
//  SignUpModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 30.10.2021.
//

import Foundation


class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var confirmation: String = ""
    @Published var errors = [String: String]()
    
    func validateForm() {
        let form = SignUpModel(firstName: firstName,
                                   lastName: lastName,
                                   email: email,
                                   phone: phone,
                                   password: password,
                                   confirmation: confirmation)
        self.errors = SignUpValidationService.isFormValid(form: form)
    }
    
}
