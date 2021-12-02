//
//  UsersService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import Foundation


struct UserService {
    static let dataService: UserDefaultsService = .shared
    static let encoder = JSONEncoder()
    static let decoder = JSONDecoder()


    static let dataKey = "users"
    
    static func getAll() -> [User]? {
        guard let allUsers = dataService.dataByKey(key: dataKey) else {
            return nil
        }
        return getDecodedUsers(from: allUsers)
    }

    static func save(newUser: User) {
        do {
            let newUserData = try encoder.encode(newUser)
            dataService.addData(data: newUserData, key: dataKey)
        } catch {
        }
    }

    static func getDecodedUsers(from users: [Data]) -> [User] {
        do {
            return try users.map {
                user in try decoder.decode(User.self, from: user)
            }
        } catch {
            return []
        }
    }
}
