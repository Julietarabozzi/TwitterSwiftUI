//
//  ExploreView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 06/02/2023.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {

            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(viewModel.users){ user in
                            NavigationLink{
                                ProfileView(currentUser: user)
                            } label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
