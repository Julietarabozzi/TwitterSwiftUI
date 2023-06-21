//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 03/02/2023.
//

import SwiftUI
import Firebase

@main

struct TwitterSwiftUIApp: App {
    
    @StateObject var viewModel = AuthenticationViewModel()
    
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            NavigationView{

             
                
               LoginView()
            }
            .environmentObject(viewModel)
        }
    }
}
