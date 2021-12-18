//
//  LikedPhotosService.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 09.12.2021.
//

import Foundation


struct LikedPhotosService {
    private var dataService: UserDefaultsService
    private var encoder: JSONEncoder
    private var decoder: JSONDecoder
    static let shared = LikedPhotosService()
    
    private init() {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        dataService = .shared
    }

    let dataKey = "likedPhotos"
    
    func like(photo: PhotoModel) {
        if liked(photo: photo) {
            remove(photoToRemove: photo)
        } else {
            save(newPhoto: photo)
        }
    }
    
    func liked(photo: PhotoModel) -> Bool {
        return dataService.keyInDictData(dictKey: photo.id, key: dataKey)
    }
    
    func getAll() -> [PhotoModel]? {
        guard let allPhotos = dataService.dictValuesByKey(key: dataKey) else {
            return nil
        }
        return getDecodedPhotos(photos: allPhotos)
    }

    private func save(newPhoto: PhotoModel) {
        do {
            let newPhotoData = try encoder.encode(newPhoto)
            dataService.addDictData(dictKey: newPhoto.id, dictValue: newPhotoData, key: dataKey)
        } catch {
        }
    }
    
    private func remove(photoToRemove: PhotoModel) {
        dataService.removeDictDataByKey(dictKey: photoToRemove.id, key: dataKey)
    }

    private func getDecodedPhotos(photos: [Data]) -> [PhotoModel] {
        do {
            return try photos.map {
                photo in try decoder.decode(PhotoModel.self, from: photo)
            }
        } catch {
            return []
        }
    }
}
