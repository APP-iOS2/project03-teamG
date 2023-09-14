//
//  OnBoardingStart.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBStartView: View {
    
    @Binding var index: Int
    
    var description: String = "맞춤화된 멤버 서비스 제공을 위해 몇 가지 질문에 답해주세요"
    
    var body: some View {
        VStack {
            Text("\(description)")
                .bold()
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top, 30)
            
            Spacer(minLength: 500)
            
            TempButton(title: OBScreen.getStated.title) {
                withAnimation {
                    index += 1
                }
            }.padding(20)
            
        }
    }
}

struct OBStartView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Blur(style: .light)
            OBStartView(index: .constant(3))
        }.ignoresSafeArea()
    }
}
