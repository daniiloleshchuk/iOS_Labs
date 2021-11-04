//
//  ContentView.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.09.2021.
//

import SwiftUI


struct SignUp: View {
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack {
            SignUpField(placeholder: Constants.firstNamePlaceholder,
                        error: viewModel.errors["firstName"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.firstName)
            SignUpField(placeholder: Constants.lastNamePlaceholder,
                        error: viewModel.errors["lastName"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.lastName)
            SignUpField(placeholder: Constants.emailPlaceholder,
                        error: viewModel.errors["email"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.email)
            SignUpField(placeholder: Constants.phonePlaceholder,
                        error: viewModel.errors["phone"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.phone)
            SignUpField(placeholder: Constants.passwordPlaceholder,
                        error: viewModel.errors["password"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.password)
            SignUpField(placeholder: Constants.passwordConfirmationPlaceholder,
                        error: viewModel.errors["password"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.passwordConfirmation)
            
            Spacer()
            
            Button{
                viewModel.validateForm()
            } label: {
                Text("Submit")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }.padding()
    }
    
    enum Constants {
        static let firstNamePlaceholder = "First name"
        static let lastNamePlaceholder = "Last name"
        static let emailPlaceholder = "Email"
        static let phonePlaceholder = "Phone"
        static let passwordPlaceholder = "Password"
        static let passwordConfirmationPlaceholder = "Password confirmation"
        static let emptyErrorMessage = ""
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
