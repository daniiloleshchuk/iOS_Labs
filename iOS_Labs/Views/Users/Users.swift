//
//  Users.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 29.11.2021.
//

import SwiftUI


struct Users: View {
    @State private var users: [User]?

    var body: some View {
        HStack {
            if let allUsers = users {
                List(allUsers) { user in
                    VStack(alignment: .leading) {
                        Text("\(user.firstName!) \(user.lastName!)")
                            .fontWeight(.bold)
                        Text(user.phoneNumber!)
                            .fontWeight(.regular)
                    }
                }
            } else {
                Text(Constants.noUsersLabel)
            }
        }
        .onAppear(perform: {
            users = UserService.shared.getAll()?.reversed()
        })
    }
    enum Constants {
        static let noUsersLabel = "No users saved"
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        Users()
    }
}
