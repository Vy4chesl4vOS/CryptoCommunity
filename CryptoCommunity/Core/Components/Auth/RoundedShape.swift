//
//  RoundedShape.swift
//  CryptoCommunity
//
//  Created by Вячеслав Утешев on 09.04.2022.
//

import Foundation
import SwiftUI

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomRight, .bottomLeft], cornerRadii: CGSize(width: 80, height: 80))
        return Path(path.cgPath)
    }
    
}

struct RoundedShapeTop: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
    
}
