//
//  UsersService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import Foundation


struct UserService {
    private var dataService: UserDefaultsService
    private var encoder: JSONEncoder
    private var decoder: JSONDecoder
    static let shared = UserService()
    
    private init() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        dataService = .shared
    }

    let dataKey = "users"
    
    func getAll() -> [User]? {
        guard let allUsers = dataService.dataByKey(key: dataKey) else {
            return nil
        }
        return getDecodedUsers(from: allUsers)
    }

    func save(newUser: User) {
        do {
            let newUserData = try encoder.encode(newUser)
            dataService.addData(data: newUserData, key: dataKey)
        } catch {
        }
    }

    private func getDecodedUsers(from users: [Data]) -> [User] {
        do {
            return try users.map {
                user in try decoder.decode(User.self, from: user)
            }
        } catch {
            return []
        }
    }
}
