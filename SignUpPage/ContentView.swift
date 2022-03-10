//
//  ContentView.swift
//  SignUpPage
//
//  Created by peter wi on 3/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("First Name")
                        .frame(width: 100)
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                }
                HStack {
                    Text("Last Name")
                        .frame(width: 100)
                    TextField("First Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                }
                NavigationLink(destination: UsernameView(firstName: $firstName, lastName: $lastName)) {
                    
                    HStack {
                        Spacer()
                        Text("Next")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(.blue)
                    .opacity(isInValidInput() ? 0.5 : 1)
                    .cornerRadius(10)
                }
                .disabled(firstName == "" || lastName == "")
                Spacer()
            }
            .padding()
            .navigationTitle("What is your name?")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func isInValidInput() -> Bool {
        firstName == "" || lastName == ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
