//
//  LikedPhotos.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 11.12.2021.
//

import SwiftUI

struct LikedPhotos: View {
    @State var likedPhotos = LikedPhotosService.shared.getAll()
    
    var body: some View {
        if #available(iOS 15.0, *) {
            List (likedPhotos ?? []) { photo in
                ImageView(photoModel: photo)
            }
            .navigationTitle(Constants.navTitle)
            .refreshable {
                    likedPhotos = LikedPhotosService.shared.getAll()
            }
        }
    }
    
    enum Constants {
        static let navTitle = "Favourites"
    }
}

struct LikedPhotos_Previews: PreviewProvider {
    static var previews: some View {
        LikedPhotos()
    }
}
