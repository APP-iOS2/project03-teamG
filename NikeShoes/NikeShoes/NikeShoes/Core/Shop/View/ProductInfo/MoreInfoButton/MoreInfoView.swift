//
//  MoreInfoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/7/23.
//

import SwiftUI

struct MoreInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("상품정보제공고시")
                .font(.system(size: 17))
                .fontWeight(.semibold)
            
            Text("""
            
            •   제조연월: 수입제품으로 각 제품별 입고 시기에 따라 상이하여 정확한 제조연월 제공이 어렵습니다. 
            제조연월을 확인하시려면 고객센터에 문의하시기 바라며, 정확한 제조연월은 배송받으신 제품의 라벨을 참고하시기 바랍니다.
            """)
            
            Text("""
            
            •   A/S 책임자와 전화번호: (유)나이키코리아 온라인 스토어 고객센터 / 080-022-0182
            """)
            
            Text("""
            
            •   세탁방법 및 취급시 주의사항: 자세한 내용은 '자세히 보기'를 클릭하여 확인 부탁드립니다.
            """)
            
            Text("""
            
            •   미성년자 권리 보호 안내: 자세한 내용은 '자세히 보기' 를 클릭하여 확인 부탁드립니다.
            """)
            
            Text("""
            
            •   품질보증기준: 품질보증기간-섬유 및 일반 소재(구입 후 6개월), 가죽소재(구입 후 1년).
            유통 중 손상되었거나 품질에 이상이 있는 제품에 한하여 소비자 피해 보상 규정에 의거 보상하여 드립니다.
            단, 제품에 부착되어 있는 사용방법 및 취급 시 주의사항에 따라 제품을 관리해 주시고, 소비자 부주의로 인한 품질 이상 및 변형에 대해서는 책임을 지지 않습니다.
            """)
            
            Text("""
            
            •   제조자/수입품의 경우 수입자를 함께 표기: Nike. Inc / (유)나이키코리아
            """)
        }
        .lineSpacing(9)
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView()
    }
}
