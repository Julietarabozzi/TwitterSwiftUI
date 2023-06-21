//
//  SideMenuView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 13/02/2023.
//

import SwiftUI

struct SideMenuView: View {
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State private var showMenu: Bool = false
    @State private var logout: Bool = false
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 32) {
            
            VStack(alignment: .leading) {
                
                AsyncImage(url: URL(string: authenticationViewModel.imageUrl), scale: 4)
                    .frame(width: 48 , height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(authenticationViewModel.fullName)
                        .font(.headline)
                    
                    Text("@\(authenticationViewModel.userName)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            NavigationLink {
                ProfileView(currentUser:User(username:authenticationViewModel.userName, fullname:authenticationViewModel.fullName, imageUrl: authenticationViewModel.imageUrl, email: ""))
            } label: {
                Label("Profile", systemImage: "person")
            }
            
            //  SideMenuItem(title: "Mi cuenta",icon: Icons.account){ProfileView(currentUser:  User(username:authenticationViewModel.userName, fullname:authenticationViewModel.fullName, imageUrl: authenticationViewModel.imageUrl, email: ""))}
            
            //     SideMenuItem(title: "Cerrar sesión",icon: Icons.logout){LoginView()}     con esta opcion no se usa la funcion logout
            Button {
                authenticationViewModel.signOut()
            }label: {
                Label("Sign Out", systemImage: "arrow.left.square")
            }
            NavigationLink(destination: LoginView(), isActive: $authenticationViewModel.loginViewEnable) {
                EmptyView()}
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
        
    }
}

