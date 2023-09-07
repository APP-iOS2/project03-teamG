//
//  CancelOrderModalView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/07.
//

import SwiftUI

struct CancelOrderModalView: View {
    
    @Binding var isModalPresented: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CancelOrderModalView_Previews: PreviewProvider {
    static var previews: some View {
        CancelOrderModalView(isModalPresented: .constant(true))
    }
}
