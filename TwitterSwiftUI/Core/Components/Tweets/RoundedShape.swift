//
//  RoundedShape.swift
//  TwitterSwiftUI
//
//  Created by Artekium on 16/02/2023.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    
    func path (in rect: CGRect)-> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 88))
        
        return Path(path.cgPath)
    }
}
