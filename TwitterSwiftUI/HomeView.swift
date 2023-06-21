//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 03/02/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)//hide navigation bar
            
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 230)
                .offset(x: showMenu ? 0 : -230)//mostrar menu o correrlo -300 px
                .background(showMenu ? Color.white : Color.clear)
            //what you put after is what appear first
        }
        .navigationTitle("Home")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                if let user = viewModel.currentUser {
                    
                    Button{
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        AsyncImage(url: URL(string: authenticationViewModel.imageUrl), scale: 4)
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    }
                }
            }
        }
        .onAppear{
            showMenu = false // para mostrar el feed en vez de el menu
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView().environmentObject(AuthenticationViewModel())
    }
}

