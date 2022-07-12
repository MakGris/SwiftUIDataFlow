//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Maksim Grischenko on 09.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name ?? "")")
                .font(.largeTitle)
                .padding(.top, 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 75)

            ButtonView(
                title: timer.buttonTitle,
                action: {timer.startTimer()},
                color: .red
            )
            .padding(.top, 75)
            Spacer()
            ButtonView(
                title: "Logout",
                action: {
                    userManager.logOut()
                },
                color: .blue
            )
            .padding(.bottom, 16)
            
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


