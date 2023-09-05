//
//  ColorExtension.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

extension Color {
 
    static let darkgreen = Color(hex: "0C824F")
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
