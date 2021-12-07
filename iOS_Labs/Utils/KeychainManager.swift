//
//  KeychainManager.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 06.12.2021.
//

import Foundation


class KeychainManager {
    
    static let standard = KeychainManager()
    private init() {}
    
    func save(data: Data, service: String, account: String) {
        
        // Create query
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary
        
        // Add data in query to keychain
        let status = SecItemAdd(query, nil)
        
        if status != errSecSuccess {
            // Print out the error
            print("Error: \(status)")
        }
    }
    
}
