//
//  ImageModel.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import SwiftUI


class ImageModel: ObservableObject {
    @Published var image: UIImage

    init(imageURL: String) {
        let url = URL(string: imageURL)
        self.image = UIImage(systemName: Constants.imagePlaceholderName)!
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.global().async { [weak self] in
                self?.image = UIImage(data: data!)!
            }
        }
    }
    
    enum Constants {
        static let imagePlaceholderName = "photo.fill"
    }
}
