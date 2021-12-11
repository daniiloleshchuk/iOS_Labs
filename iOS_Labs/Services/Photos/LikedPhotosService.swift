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
    
    func getAll() -> [PhotoModel]? {
        guard let allPhotos = dataService.dataByKey(key: dataKey) else {
            return nil
        }
        return getDecodedPhotos(photos: allPhotos)
    }

    private func save(newPhoto: PhotoModel) {
        do {
            let newPhotoData = try encoder.encode(newPhoto)
            dataService.addData(data: newPhotoData, key: dataKey)
        } catch {
        }
    }
    
    private func remove(photoToRemove: PhotoModel) {
        do {
            let photoToRemoveData = try encoder.encode(photoToRemove)
            dataService.removeData(data: photoToRemoveData, key: dataKey)
        } catch {
        }
    }
    
    private func liked(photo: PhotoModel) -> Bool {
        do {
            let photoToCheck = try encoder.encode(photo)
            return dataService.saved(data: photoToCheck, key: dataKey)
        } catch {
            return false
        }
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
