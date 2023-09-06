//
//  NavigationNikeSetting.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/06.
//

import Foundation
import SwiftUI

struct NavigationNikeSetting: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    
    let title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundColor(.black)
                }
            }
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarBackButtonHidden()
    }
}
