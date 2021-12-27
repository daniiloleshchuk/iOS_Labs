//
//  Photo.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 09.12.2021.
//

import SwiftUI

struct Photo: View {
    @ObservedObject var photoModel: PhotoModel
    var imageModel: ImageModel
    
    init(photoModel: PhotoModel) {
        photoModel.isLiked = LikedPhotosService.shared.liked(photo: photoModel)
        self.photoModel = photoModel
        self.imageModel = ImageModel(imageURL: photoModel.regularImageUrl()!)
    }
    
    var body: some View {
        Image(uiImage: imageModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text(photoModel.description ?? Constants.defaultDescription)
        LikeButton(isLiked: photoModel.isLiked) {
            LikedPhotosService.shared.like(photo: photoModel)
        }
    }
    
    enum Constants {
        static let defaultDescription = "Default description"
    }
}
