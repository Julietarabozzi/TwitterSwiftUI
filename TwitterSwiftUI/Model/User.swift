//
//  User.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 09/03/2023.
//

import FirebaseFirestoreSwift

/*crear modelo con la data de firebase:
 User data is ["uid": aJnK2kxtBUe8kTPqWE4xu6b3sEt1, "imageUrl": https://firebasestorage.googleapis.com:443/v0/b/twitterswiftui-b5960.appspot.com/o/image%2F677C63C8-ACD1-4857-8E7D-E0754D4C0EF2?alt=media&token=d6374dfa-97b6-4efd-8c53-c3eedcc14d3a, "username": test, "fullname": Test test , "email": Test3@gmail.com]
 */

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let imageUrl: String
    let email: String
}
