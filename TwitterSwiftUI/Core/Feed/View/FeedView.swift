//
//  FeedView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 06/02/2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 20, id: \.self){_ in
                        TweetRowView()
                            .padding()
                    }
                }
            }
            Button{
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .padding()
            }.fullScreenCover(isPresented: $showNewTweetView){
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
