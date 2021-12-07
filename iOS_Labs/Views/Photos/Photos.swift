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
        Group {
            if viewModel.photos.isEmpty {
                Text(Constants.noPhotosPlaceholder)
            } else {
                List (viewModel.photos) { photo in
                    ImageView(imageUrl: photo.regularImageUrl()!)
                }
                .listStyle(PlainListStyle())

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
    }
 }

struct Photos_Previews: PreviewProvider {
    static var previews: some View {
        Photos()
    }
}
