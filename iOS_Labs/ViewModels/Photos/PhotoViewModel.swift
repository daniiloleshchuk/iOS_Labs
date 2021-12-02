//
//  PhotoViewModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.12.2021.
//

import Foundation


class PhotosViewModel: ObservableObject {
     @Published var photos = [PhotoModel]()

     func loadPhotos() {
         PhotoController.photos(action: {fetchedPhotos in
             if let photos = fetchedPhotos {
                 self.photos = photos
             } else {
                 self.photos = []
             }
         })
     }
 }
