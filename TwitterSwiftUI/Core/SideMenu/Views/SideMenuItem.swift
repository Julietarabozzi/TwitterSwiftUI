//
//  SideMenuRowView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 13/02/2023.
//

import SwiftUI

struct SideMenuItem<Content: View>: View,Identifiable {
    var id = UUID()
    @State var title:String
    @State var icon : String
    let navigate:()-> Content
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.blue)
                .frame(width: 20, height: 20)
                .padding(.trailing,20)
            NavigationLink(destination: navigate,
                           label: {
                Text(title)
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            })
            
        }
            
        
    }
}


/*
struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
                    
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
*/
