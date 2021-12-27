//
//  LikedPhotos.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 11.12.2021.
//

import SwiftUI

struct LikedPhotos: View {
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        Group {
            if #available(iOS 15.0, *) {
                List (viewModel.likedPhotos) { photo in
                    ImageView(photoModel: photo)
                }
                .navigationTitle(Constants.navTitle)
                .refreshable {
                    viewModel.loadLikedPhotos()
                }
            }
        }.onAppear(perform: {
            viewModel.loadLikedPhotos()
        })
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
