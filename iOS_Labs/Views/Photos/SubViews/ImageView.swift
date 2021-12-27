//
//  Image.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.12.2021.
//

import SwiftUI


struct ImageView: View {
    @ObservedObject var imageModel: ImageModel
    var photoModel: PhotoModel

    init(photoModel: PhotoModel) {
        self.photoModel = photoModel
        self.imageModel = ImageModel(imageURL: photoModel.regularImageUrl()!)
    }

    var body: some View {
        ZStack {
            Image(uiImage: imageModel.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            NavigationLink(destination: Photo(photoModel: photoModel)) {
                EmptyView()
            }
        }
        .listRowInsets(EdgeInsets())
    }
}
