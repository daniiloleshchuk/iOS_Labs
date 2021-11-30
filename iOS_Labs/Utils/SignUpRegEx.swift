//
//  ValidationRegexp.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.11.2021.
//

import Foundation


enum SignUpRegEx {
     static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
     static let phone = "^[0-9+]{0,1}+[0-9]{5,16}$"
     static let password = ".{8,}"
     static let `default` = ""
 }
