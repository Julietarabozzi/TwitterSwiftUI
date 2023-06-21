//
//  AuthenticationViewModel.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 28/02/2023.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseAuth

protocol AuthenticationViewModelProtocol: ObservableObject {
    var userSession: FirebaseAuth.User? {get set}
    var didAuthenticateUser: Bool {get set}
    var currentUser: User? {get set}
    var userName: String {get set}
    var fullName: String {get set}
    var imageUrl: String {get set}
    var homeViewEnabled: Bool {get set}
    
    var loginViewEnable: Bool {get set}

    
    var isLoading: Bool {get set}
    func login(withEmail email: String, password: String)
    func registrer(withEmail email: String, password: String, fullname: String, username: String)
    func signOut()
    func uploadProfileImage(_ image: UIImage)
    func fetchUser()
    func goToHomeView()
    
    func goToLoginView()

    
}


public class AuthenticationViewModel: AuthenticationViewModelProtocol {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var homeViewEnabled: Bool
    
    @Published var loginViewEnable: Bool
 
    @Published var userName = ""
    @Published var fullName = ""
    @Published var imageUrl = ""
    @Published var isLoading: Bool = false
    
    
    
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    //si el usuario esta logueado, la propiedad tiene un valor. sino la propiedad es un nill
    init() {

        self.homeViewEnabled = false
        self.loginViewEnable = false
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
       
    }
    
    func login(withEmail email: String, password: String) {
        self.isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.isLoading = false
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {
                self.isLoading = false
                return
            }
            self.userSession = user
            self.fetchUser()
            self.isLoading = false
            print("Logged in")
            self.goToHomeView()
       
        }
    }
        
    func registrer(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            //diccionario
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
            }
        }
    }
    
   func signOut() {
      //  sets user session to nil so we show login view
        userSession = nil
   //     signs user out
       try? Auth.auth().signOut()
       print("signed out")
    self.goToLoginView()
        }

    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["imageUrl": imageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                    self.goToHomeView()
            }
        }
    }
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
       
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            self.fullName = user.fullname
            self.userName = user.username
            self.imageUrl = user.imageUrl
            print("DATA \(user)")
        }
    }
    func goToHomeView() {
        self.homeViewEnabled = true
    }
    func goToLoginView() {
        self.loginViewEnable = true
    }
}


