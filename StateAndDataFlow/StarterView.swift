//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Maksim Grischenko on 09.07.2022.
//

import SwiftUI

struct StarterView: View {

    @EnvironmentObject private var user: UserManager
    var body: some View {
        Group {
            if user.isRegistered ?? false {
                ContentView()
            } else {
                RegisterView()
            }
        }
    
    }
    
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
