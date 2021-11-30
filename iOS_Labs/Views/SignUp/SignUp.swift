//
//  ContentView.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.09.2021.
//

import SwiftUI


struct SignUp: View {
    @ObservedObject var signUp = SignUpViewModel()
    @State var errors = [SignUpFieldType :String]()
    
    var body: some View {
        VStack {
            ForEach(signUp.fields) { field in
                SignUpField(field: field,
                            error: $errors[field.type])
            }
            
            Spacer()

            Button {
                errors = SignUpValidationService.vaildateForm(form: signUp)
            } label: {
                Text(Constants.submit)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }.padding()
    }
    enum Constants {
        static let submit = "Submit!"
        static let emptyError = ""
    }
 }

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(signUp: SignUpViewModel(), errors: Constants.errors)
    }
    enum Constants {
        static let errors = [SignUpFieldType: String]()
    }
}
