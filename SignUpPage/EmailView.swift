//
//  EmailView.swift
//  SignUpPage
//
//  Created by peter wi on 3/10/22.
//

import SwiftUI

struct EmailView: View {
    @State private var email = ""
    @State private var phone = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Email")
                    .frame(width: 100)
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            }
            HStack {
                Text("Phone Number")
                    .frame(width: 100)
                    .multilineTextAlignment(.center)

                TextField("Phone Number", text: $phone)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            }
            NavigationLink(destination: DoneView()) {
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
        .navigationTitle("Your contact?")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func isInValidInput() -> Bool {
        email == "" || phone == ""
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
