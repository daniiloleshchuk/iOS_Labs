//
//  PhotoModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.12.2021.
//

import Foundation


class PhotoModel: Decodable, Encodable, Identifiable {
    var id: String
    var description: String? = ""
    var sourceUrls: [String: String]
    
    func regularImageUrl() -> String? {
        return self.sourceUrls[Constants.regularImgKey]
    }
    
    func fullImageUrl() -> String? {
        return self.sourceUrls[Constants.fullImgKey]
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "alt_description"
        case sourceUrls = "urls"
    }
    
    enum Constants {
        static let usernameKey = "username"
        static let regularImgKey = "regular"
        static let fullImgKey = "full"
    }
 }
