//
//  UserStatsView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 13/02/2023.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        
        HStack(spacing: 30){
            HStack(spacing: 4){
            Text("1")
            .font(.subheadline).bold()
                
            Text("Following")
            .font(.caption)
            .foregroundColor(.gray)
            }
            HStack(spacing: 4){
            Text("870")
            .font(.subheadline).bold()
                
            Text("Followers")
            .font(.caption)
            .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
