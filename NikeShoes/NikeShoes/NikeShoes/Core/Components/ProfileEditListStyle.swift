//
//  ProfileEditListStyle.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/07.
//

import Foundation
import SwiftUI

struct ProfileEditListStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color(uiColor: .tertiaryLabel), lineWidth: 1)
            )
            .listSectionSeparator(.hidden)
            .foregroundColor(Color(uiColor: .tertiaryLabel))
          
    }
}
