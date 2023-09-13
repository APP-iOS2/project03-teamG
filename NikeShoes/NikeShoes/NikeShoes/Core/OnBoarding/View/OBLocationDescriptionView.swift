//
//  OBWelcomeView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBLocationDescriptionView: View {
    
    @Binding var index: Int
    var description: String = "위치 업데이트"
    var description2: String = "Nike 앱에서 최상의 경험을 하려면 지원되는 국가/ 지역을 내 위치로 선택하세요. 지원되지 않는 국가/ 지역인 경우, Nike.com을 방문하세요."
    var date: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {

            Spacer(minLength: 300)

            Image("nike_ob")
            HStack {
                Text("\(description)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                Spacer()
            }

            HStack {
                Text("\(description2)")
                    .bold()
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                Spacer()
            }

            Spacer()
            
            HStack {
                Spacer()
                TempButton(title: OBScreen.locationDescription.title) {
                    Task {
                        index += 1
                    }
                }.padding(20)
                Spacer()
            }
        }
    }
}

struct OBLocationDescriptionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            Color.black
            OBLocationDescriptionView(index: .constant(3))
        }.ignoresSafeArea()
    }
}
