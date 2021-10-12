//
//  ContentView.swift
//  iOS_Labs
//
//  Created by Daniil Oleshchuk on 28.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var fieldText = ""
    @State var text = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $fieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text(text).multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                if fieldText.count > 0 {
                    text = "Hello " + fieldText + "!"
                }
            } label: {
                Text("Say Hello")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
