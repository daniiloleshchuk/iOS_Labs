//
//  SignUpFormModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.11.2021.
//

import Foundation


class SignUpFieldModel: ObservableObject, Identifiable {
    var type: SignUpFieldType
    var label: String
    var value: String = ""
    var isSecured: Bool

    init(label: String, type: SignUpFieldType, isSecured: Bool) {
        self.label = label
        self.type = type
        self.isSecured = isSecured
    }
}
