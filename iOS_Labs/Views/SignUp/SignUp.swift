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
            SignUpField(type: SignUpFieldType.firstName,
                        error: $viewModel.errors["firstName"],
                        text: $viewModel.firstName)
            SignUpField(type: SignUpFieldType.lastName,
                        error: viewModel.errors["lastName"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.lastName)
            SignUpField(type: SignUpFieldType.email,
                        error: viewModel.errors["email"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.email)
            SignUpField(type: SignUpFieldType.phone,
                        error: viewModel.errors["phone"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.phone)
            SignUpField(type: SignUpFieldType.password,
                        error: viewModel.errors["password"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.password)
            SignUpField(type: SignUpFieldType.confirmation,
                        error: viewModel.errors["password"] ?? Constants.emptyErrorMessage,
                        text: $viewModel.confirmation)
            
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
        static let emptyErrorMessage = ""
    }
    

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
