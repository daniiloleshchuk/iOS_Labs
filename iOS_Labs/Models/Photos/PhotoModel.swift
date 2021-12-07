//
//  PhotoModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.12.2021.
//

import Foundation


struct PhotoModel: Decodable, Identifiable {
    var id: String
    var description: String? = ""
    var sourceUrls: [String: String]
    
    func regularImageUrl() -> String? {
        return self.sourceUrls[Constants.regularImgKey]
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "alt_description"
        case sourceUrls = "urls"
    }
    
    enum Constants {
        static let usernameKey = "username"
        static let regularImgKey = "regular"
    }
 }
