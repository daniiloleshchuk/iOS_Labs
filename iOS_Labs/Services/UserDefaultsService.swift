//
//  UserDefaultsService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import Foundation


class UserDefaultsService {
    static let shared = UserDefaultsService()

    private let userDefaults = UserDefaults.standard

    func addData(data: Data, key: String) {
        guard var persisted = self.dataByKey(key: key) else {
            return userDefaults.set([data], forKey: key)
        }
        persisted.append(data)
        userDefaults.set(persisted, forKey: key)
    }

    func dataByKey(key: String) -> [Data]? {
        userDefaults.array(forKey: key) as? [Data]
    }

}
