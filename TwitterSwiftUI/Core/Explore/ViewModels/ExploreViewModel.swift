//
//  ExploreViewModel.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 17/03/2023.
//

import Foundation


class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            print("DEBUG: Users\(users)")
        }
    }
}
