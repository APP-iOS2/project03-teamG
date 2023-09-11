//
//  OnBoardingStart.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBLocationView: View {
    
    var description: String = "위치 서비스를 사용해 보세요. 가까운 나이키 매장 및 해당 매장에서 이용 가능한 서비스를 확인 할 수 있습니다."
    
    var body: some View {
        VStack {
            Text("\(description)")
                .bold()
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.top, 30)
            Spacer(minLength: 500)
        }
    }
}

struct OBLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Blur(style: .light)
            OBLocationView()
        }.ignoresSafeArea()
    }
}
