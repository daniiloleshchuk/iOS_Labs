//
//  PhotoController.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import Foundation
import Alamofire


struct PhotoManager {
    private static var API_BASE_URL: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Unsplash-Info", ofType: "plist") else {
                fatalError("Couldn't find file 'Unsplash-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_BASE_URL") as? String else {
                fatalError("Couldn't find key 'API_BASE_URL' in 'Unsplash-Info.plist'.")
            }
            return value
        }
    }
    
    private static var API_ACCESS_KEY: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Unsplash-Info", ofType: "plist") else {
                fatalError("Couldn't find file 'Unsplash-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_ACCESS_KEY") as? String else {
                fatalError("Couldn't find key 'API_ACCESS_KEY' in 'Unsplash-Info.plist'.")
            }
            return value
        }
    }
    
    private static var API_SECRET_KEY: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Unsplash-Info", ofType: "plist") else {
                fatalError("Couldn't find file 'Unsplash-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_SECRET_KEY") as? String else {
                fatalError("Couldn't find key 'API_SECRET_KEY' in 'Unsplash-Info.plist'.")
            }
            return value
        }
    }
    
    static func photos(action: @escaping ([PhotoModel]?) -> Void) {
        AF.request(API_BASE_URL + "photos/?client_id=" + API_ACCESS_KEY)
            .responseDecodable(of: [PhotoModel].self) { response in
                action(response.value)
        }
    }
}
