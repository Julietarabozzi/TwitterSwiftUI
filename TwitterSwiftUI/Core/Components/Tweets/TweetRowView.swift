//
//  TweetRowView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 06/02/2023.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading){
            //profile image+user info+ tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                        
                        Text("@Batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Text("I believe in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            //action buttons
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
