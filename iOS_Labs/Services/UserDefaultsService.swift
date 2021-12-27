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

    func addArrayData(data: Data, key: String) {
        guard var persisted = self.arrayDataByKey(key: key) else {
            return userDefaults.set([data], forKey: key)
        }
        persisted.append(data)
        userDefaults.set(persisted, forKey: key)
    }
    
    func removeArrayData(data: Data, key: String) {
        guard var persisted = self.arrayDataByKey(key: key) else {
            return
        }
        if let index = persisted.firstIndex(of: data) {
            persisted.remove(at: index)
            userDefaults.set(persisted, forKey: key)
        }
    }

    func arrayDataByKey(key: String) -> [Data]? {
        userDefaults.array(forKey: key) as? [Data]
    }
    
    func savedInArray(data: Data, key: String) -> Bool {
        let arr = userDefaults.array(forKey: key) as? [Data]
        return arr!.contains(data)
    }
    
    func addDictData(dictKey: String, dictValue: Data, key: String) {
        guard var persisted = userDefaults.object(forKey: key) as? [String: Data] else {
            let dictData = [dictKey: dictValue]
            return userDefaults.set(dictData, forKey: key)
        }
        persisted[dictKey] = dictValue
        userDefaults.set(persisted, forKey: key)
    }
    
    func dictDataByKey(key: String) -> [String: Data] {
        userDefaults.object(forKey: key) as? [String: Data] ?? [:]
    }
    
    func dictValuesByKey(key: String) -> [Data]? {
        Array(dictDataByKey(key: key).values)
    }
    
    func removeDictDataByKey(dictKey: String, key: String) {
        guard var persisted = userDefaults.object(forKey: key) as? [String: Data] else {
            return
        }
        persisted.removeValue(forKey: dictKey)
        userDefaults.set(persisted, forKey: key)
    }
    
    func keyInDictData(dictKey: String, key: String) -> Bool {
        guard let persisted = userDefaults.object(forKey: key) as? [String: Data] else {
            return false
        }
        return persisted.keys.contains(dictKey)
    }

}
