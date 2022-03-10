//
//  UsernameView.swift
//  SignUpPage
//
//  Created by peter wi on 3/10/22.
//

import SwiftUI

struct UsernameView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    
    @State private var idStr = ""
    @State private var passwordStr = ""
    @State private var passwordConfirmStr = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Username")
                    .frame(width: 100)
                TextField("Username", text: $idStr)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            }
            HStack {
                Text("Password")
                    .frame(width: 100)
                SecureField("Password", text: $passwordStr)
                    .textFieldStyle(.roundedBorder)
            }
            HStack {
                Text("Password Confirmation")
                    .frame(width: 100, alignment: .center)
                    .multilineTextAlignment(.center)
                SecureField("Password", text: $passwordConfirmStr)
                    .textFieldStyle(.roundedBorder)
            }
            NavigationLink(destination: EmailView()) {
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
            .disabled(isInValidInput())

            Spacer()
        }
        .padding()
        .navigationTitle("Welcome! \(firstName) \(lastName)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func isInValidInput() -> Bool {
        idStr == "" || passwordStr == "" || passwordConfirmStr == "" || passwordStr != passwordConfirmStr
    }
}
