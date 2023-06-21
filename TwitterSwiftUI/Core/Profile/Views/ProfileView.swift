//
//  ProfileView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 07/02/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @State private var selecterFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var currentUser: User
    
    var body: some View {
         VStack(alignment: .leading){
           //headerView
            ZStack(alignment: .bottomLeading){
                Color(.systemBlue)
                    .ignoresSafeArea()
                
                VStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .offset(x: -10, y: 12)
                    }
                    AsyncImage(url: URL(string: currentUser.imageUrl), scale: 2.5)
                        .frame(width: 70 , height: 70)
                        .clipShape(Circle())
                        .offset(x: 15, y: 20)
                }
                
            }.frame(height: 96)
            
            //actionButtons
            HStack{
                Spacer()
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .padding(6)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
                
                Button{
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline).bold()
                        .frame(width: 120, height: 32)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                }
            }
            .padding(.trailing)
            
          //  userInfoDetails
            VStack(alignment: .leading, spacing: 4){
                
                HStack{
                    
                 //   Text("fullname")
                    Text(currentUser.fullname)
                        .font(.title2).bold()
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(Color(.systemBlue))
                }
                
            //    Text("@username")
                Text("@\(currentUser.username)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Your favourite villain")
                    .font(.subheadline)
                    .padding(.vertical)
                
                HStack(spacing: 24){
                    HStack{
                      Image(systemName: "mappin.and.ellipse")
                      Text("Gotham, NY")
                    }
                    HStack{
                    Image(systemName: "link")
                    Text("www.thejocker.com")
                    }
                }.font(.caption)
                .foregroundColor(.gray)
                
                UserStatsView()
                .padding(.vertical)
            }
            .padding(.horizontal)
            
            //tweetFilterBar
            HStack {
                ForEach(TweetFilterViewModel.allCases, id: \.rawValue) {item in
                    VStack{
                        Text(item.title)
                            .font(.subheadline)
                            .fontWeight(selecterFilter == item ? .semibold: .regular)
                        .foregroundColor(selecterFilter == item ? .black: .gray)
                        
                        if selecterFilter == item {
                           Capsule()
                                .foregroundColor(Color(.systemBlue))
                                .frame(height: 3)
                                .matchedGeometryEffect(id:"filter", in: animation) //sliding animation
                        } else {
                            Capsule()
                                .foregroundColor(Color(.clear))
                                .frame(height: 3)
                        }
                        
                    }
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    self.selecterFilter = item
                        }
                    }
                }
            }
            .overlay(Divider().offset(x:0, y:16))
            
           // tweetsView
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 9, id: \.self){ _ in
                        TweetRowView()
                            .padding()
                    }
                }
            }
            
            
            Spacer()
        }.navigationBarHidden(true)
    }
}

//struct ProfileView_Previews: PreviewProvider {
  //  static var previews: some View {
  //      ProfileView( user: user)
  //  }
//}


