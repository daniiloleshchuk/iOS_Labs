//
//  ContentView.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.09.2021.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var signUpForm = SignUpFormModel()
    @State var signUpFormErrors = [String: String]()
    
    var body: some View {
        VStack {
            SignUpFormField(form: signUpForm, placeholder: "First name", error: signUpFormErrors["firstName"] ?? "", text: $signUpForm.firstName)
            SignUpFormField(form: signUpForm, placeholder: "Last name", error: signUpFormErrors["lastName"] ?? "", text: $signUpForm.lastName)
            SignUpFormField(form: signUpForm, placeholder: "Email", error: signUpFormErrors["email"] ?? "", text: $signUpForm.email)
            SignUpFormField(form: signUpForm, placeholder: "Phone", error: signUpFormErrors["phone"] ?? "", text: $signUpForm.phone)
            SignUpFormField(form: signUpForm, placeholder: "Password", error: signUpFormErrors["password"] ?? "", text: $signUpForm.password)
            SignUpFormField(form: signUpForm, placeholder: "Password", error: signUpFormErrors["password"] ?? "", text: $signUpForm.passwordConfirmation)
            
            Spacer()
            
            Button{
                signUpFormErrors = SignUpFormValidationService.isFormValid(form: signUpForm)
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
}


struct SignUpFormField: View {
    @ObservedObject var form: SignUpFormModel
    var placeholder: String
    var error: String
    var text: Binding<String>

    var body: some View {
        if placeholder.lowercased().contains("password") {
            SecureField(placeholder, text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } else {
            TextField(placeholder, text: text)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Text(error)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
