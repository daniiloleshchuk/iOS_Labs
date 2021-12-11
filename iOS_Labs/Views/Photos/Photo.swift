//
//  Photo.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 09.12.2021.
//

import SwiftUI

struct Photo: View {
    @State var photoModel: PhotoModel
    var imageModel: ImageModel
    
    init(photoModel: PhotoModel) {
        self.photoModel = photoModel
        self.imageModel = ImageModel(imageURL: photoModel.regularImageUrl()!)
    }
    
    var body: some View {
        Image(uiImage: imageModel.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text(photoModel.description ?? Constants.defaultDescription)
        Button(action: {LikedPhotosService.shared.like(photo: photoModel)},
               label: {Text(Constants.btnLikeLabel)})
    }
    
    enum Constants {
        static let btnLikeLabel = "Like"
        static let defaultDescription = "Default description"
    }
}
