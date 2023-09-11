//
//  DeliveryReturnInfoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/11/23.
//

import SwiftUI

struct DeliveryReturnInfoView: View {
    var body: some View {
        TabView {
            DeliveryInfoView()
            ReturnInfoView()
        }
        .frame(width: 360, height: 132)
        .background(Color.lightGray)
        .tabViewStyle(PageTabViewStyle())
        .padding(.bottom, 25)
    }
}

struct DeliveryReturnInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryReturnInfoView()
    }
}
