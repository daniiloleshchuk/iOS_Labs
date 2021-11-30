//
//  General.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import SwiftUI

struct General: View {
    var body: some View {
        NavigationView {
            VStack {
                SignUp()
                
                HStack {
                    NavigationLink(destination: Users()){
                        Text(Constants.usersNavLinkLabel)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: Photos()){
                        Text(Constants.photosNavLinkLabel)
                    }
                }
                .padding()
                .navigationTitle(Constants.navigationTitle)
            }
        }
        .navigationTitle(Constants.navigationTitle)
    }
    enum Constants {
        static let usersNavLinkLabel = "Users"
        static let photosNavLinkLabel = "Photos"
        static let navigationTitle = "Lab 4"
    }
}

struct General_Previews: PreviewProvider {
    static var previews: some View {
        General()
    }
}
