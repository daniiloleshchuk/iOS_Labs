//
//  LikeButton.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 14.12.2021.
//

import SwiftUI

struct LikeButton: View {
    @State var isLiked: Bool
    var action: () -> Void
    
    var body: some View {
        Button(
            action: {
                action()
                isLiked = !isLiked
            },
            label: {
                Image(systemName: isLiked ? Constants.likedImg : Constants.disLikedImg)
            })
    }
    enum Constants {
        static let disLikedImg = "heart"
        static let likedImg = "heart.fill"
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(isLiked: false, action: {})
    }
}
