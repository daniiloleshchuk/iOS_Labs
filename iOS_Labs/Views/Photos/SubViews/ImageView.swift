//
//  Image.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 02.12.2021.
//

import SwiftUI


struct ImageView: View {
     @ObservedObject var imageModel: ImageModel

     init(imageUrl: String) {
         self.imageModel = ImageModel(imageURL: imageUrl)
     }

     var body: some View {
        Image(uiImage: imageModel.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
//        .listRowInsets(EdgeInsets())
     }
 }


struct Img_Previews: PreviewProvider {
    static var previews: some View {
        let imageUrl = "https://images.unsplash.com/photo-1633113215937-18127a49a8a4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzkxNTB8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzODQ3NTUwMw&ixlib=rb-1.2.1&q=80&w=1080"
        ImageView(imageUrl: imageUrl)
    }
}
