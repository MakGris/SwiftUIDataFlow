//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Maksim Grischenko on 09.07.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var userName = ""
    @State private var color = Color.red
    @State private var buttonDisabled = true
    @EnvironmentObject private var user: UserManager
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $userName)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 30)
                    .padding(.bottom)
                               
                Text("\(userName.count)")
                    .frame(width: 25, height: 30, alignment: .trailing)
                    .padding(.trailing)
                    .padding(.bottom)
                    .foregroundColor(color)
                    .onChange(of: userName.count) { newValue in
                       checkName(value: newValue)
                    }
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(buttonDisabled)
    
        }
    }
    private func registerUser() {
        if !userName.isEmpty {
            user.logIn(userName: userName)
        }
    }
    private func checkName(value: Int) {
        if value >= 3 {
            color = Color.blue
            buttonDisabled = false
            return
        } else {
            color = Color.red
            buttonDisabled = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
