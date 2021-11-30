//
//  SignUpFieldType.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.11.2021.
//

import Foundation


enum SignUpFieldType {
    case firstName
    case lastName
    case email
    case phone
    case password
    case confirmation
    case unknown
    
    func getErrorText() -> String {
        switch self {
        case .firstName:
            return SignUpError.firstName
        case .lastName:
            return SignUpError.lastName
        case .email:
            return SignUpError.email
        case .phone:
            return SignUpError.phone
        case .password:
            return SignUpError.password
        case .confirmation:
            return SignUpError.confirmation
        default:
            return SignUpError.default
        }
    }
    
    func getRegEx() -> String {
        switch self {
        case .email:
            return SignUpRegEx.email
        case .phone:
            return SignUpRegEx.phone
        case .password:
            return SignUpRegEx.password
        default:
            return SignUpRegEx.default
        }
    }
}
