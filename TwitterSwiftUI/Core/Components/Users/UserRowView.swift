//
//  UserRowView.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 13/02/2023.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12){
            AsyncImage(url: URL(string: user.imageUrl), scale: 4)
                .frame(width: 56 , height: 56)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct UserRowView_Previews: PreviewProvider {
//  static var previews: some View {
//    UserRowView(user: user)
// }
//}
