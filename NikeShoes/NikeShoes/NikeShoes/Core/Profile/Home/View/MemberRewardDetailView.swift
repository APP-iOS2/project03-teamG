//
//  MemberRewardDetailView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/05.
//

import SwiftUI

struct MemberRewardDetailView: View {
    let introTitle: String = "환영합니다!"
    let introContent: String = "나이키 멤버로 함께 할 여정을 응원합니다! \n앱에서 첫 주문 시, 총 결제 금액에서 15% 할인이 적용됩니다."
    let themeTitle1: String = "[혜택 내용]"
    let theme1Content1: String = "- 웰컴 프로모션 혜택: 앱 첫 구매 15% 할인 적용"
    let theme1Content2: String = "- 프로모션 코드 사용 가능 최대 금액: 300,000원 (최대 45,000할인)"
    let themeTitle2: String = "[유의 사항]"
    let theme2Content1: String = "- 계정 당 1회 사용 가능"
    let theme2Content2: String = "- SNKRS, Apple Watch 관련 제품, 일부 앱 전용 제품 등을 제외한 전체 제품에 적용됩니다."
    
    var body: some View {
        VStack(alignment: .leading){
            Text(introTitle)
            Text(introContent)
            Text(themeTitle1)
            Text(theme1Content1)
            Text(theme1Content2)
            Text(themeTitle2)
            Text(theme2Content1)
            Text(theme2Content2)
        }
    }
}

struct MemberRewardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRewardDetailView()
    }
}
