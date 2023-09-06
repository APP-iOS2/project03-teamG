//
//  Font.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import Foundation
import SwiftUI

extension Font {
    /// 큰 타이틀에 사용됩니다(24, semibold)
    static let semiBold24 = Self.system(size: 24, weight: .semibold)
    /// 큰 타이틀에 사용됩니다(24, medium)
    static let mediumBold24 = Self.system(size: 24, weight: .medium)
    
    /// 중간 타이틀에 사용됩니다(20, medium)
    static let medium20 = Self.system(size: 20, weight: .medium)
    
    /// 작은 타이틀에 사용됩니다(16, bold)
    static let bold16 = Self.system(size: 16, weight: .bold)
    /// 작은 타이틀에 사용됩니다(16, medium)
    static let medium16 = Self.system(size: 16, weight: .medium)
    
    /// 셀 타이틀에 사용됩니다(12, semibold)
    static let semiBold12 = Self.system(size: 12, weight: .semibold)
    
    /// 셀 정보에 사용됩니다(12, medium)
    static let medium12 = Self.system(size: 12, weight: .medium)
    /// 셀 정보에 사용됩니다(12, regular)
    static let regular12 = Self.system(size: 12, weight: .regular)
    
    /// 작은 글씨에 사용됩니다(11, medium)
    static let medium11 = Self.system(size: 11, weight: .medium)
    /// 작은 글씨에 사용됩니다(11, regular)
    static let regular11 = Self.system(size: 11, weight: .regular)
}
