//
//  Photos.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import SwiftUI

struct Photos: View {
    @ObservedObject var viewModel = PhotosViewModel()
    
    var body: some View {
        VStack {
            NavigationLink(destination: LikedPhotos()) {
                Text(Constants.favouritesPlaceholder)
            }
            if viewModel.photos.isEmpty {
                Text(Constants.noPhotosPlaceholder)
            } else {
                if #available(iOS 15.0, *) {
                    List (viewModel.photos) { photo in
                        ImageView(photoModel: photo)
                    }
                    .listStyle(PlainListStyle())
                    .refreshable {
                        viewModel.loadPhotos()
                    }
                }
            }
        }
        .navigationBarTitle(Constants.navBarTitle, displayMode: .inline)
        .onAppear(perform: {
            viewModel.loadPhotos()
        })

    }
    
    enum Constants {
        static let noPhotosPlaceholder = "No photos"
        static let navBarTitle = "Photos"
        static let favouritesPlaceholder = "Favourites"
    }
 }

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
