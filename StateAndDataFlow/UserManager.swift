//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Maksim Grischenko on 09.07.2022.
//

import SwiftUI

final class UserManager: ObservableObject {
    @AppStorage("register") var isRegistered: Bool?
    @AppStorage("name") var name: String?
    
    func logIn(userName: String) {
        name = userName
        isRegistered = true
    }
    
    func logOut() {
        name = ""
        isRegistered = false
    }
}
