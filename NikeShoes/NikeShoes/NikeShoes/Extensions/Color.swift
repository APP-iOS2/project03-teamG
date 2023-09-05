//
//  Color.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/05.
//

import Foundation
import SwiftUI

extension Color {
    // 영역 구분용 연한 회색
    static var lightGray: Color {
        return Color(hex: 0xF7F7F7)
    }
    
    // 기본 아이콘 색상 등 디폴트 회색
    static var defaultGray: Color {
        return Color(hex: 0xCCCCCC)
    }
    
    // 글씨용 진한 회색
    static var textGray: Color {
        return Color(hex: 0x707072)
    }
    
    // 베스트셀러, 품절용 빨간색
    static var nikeRed: Color {
        return Color(hex: 0xD23918)
    }
    
    // 주문완료용 초록색
    static var nikeGreen: Color {
        return Color(hex: 0x007D47)
    }
    
    // 알림용 주황색
    static var alertOrange: Color {
        return Color(hex: 0xFA5400)
    }
    
    // 설정 텍스트용 주황색
    static var textOrange: Color {
        return Color(hex: 0xFD8421)
    }
}

extension Color {
    init(hex: UInt, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: opacity
        )
    }
}
