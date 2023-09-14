//
//  ProductDetailInfoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/7/23.
//

import SwiftUI
import NikeShoesCore

struct ProductDetailInfoView: View {
    @Environment(\.dismiss) private var dismiss
    var shoesData: ShoesDTO
    
    var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("전설적인 스타일, 새로운 감각.")
                            .font(.medium20)
                        
                        Text(shoesData.description)
                            .padding(.vertical, 8)
                        
                        Text("상품 특징")
                            .font(.medium20)
                        
                        Text("""
                           • 갑피의 스티치된 오버레이로 내구성과 지지력을 제공하며 헤리티지 스타일 선사
                           • 본래 퍼포먼스 농구화를 위해 고안된 나이키 에어 쿠셔닝이 온종일 가볍고 편안한 착화감 선사합니다.
                           • 로우컷 실루엣이 깔끔하고 매끈한 룩 연출
                           • 부드럽고 편안한 패딩 카라
                        """)
                            .padding(.vertical, 8)

                        Text("상품 상세 정보")
                            .font(.medium20)
            
                        Text("""
                           • 폼 중창
                           • 토의 천공 디테일
                           • 고무 밑창
                        """)
                            .padding(.vertical, 8)
            
                        Text("\(shoesData.name)에 대하여")
                            .font(.medium20)
                        
                        Text("""
                        1982년에 첫선을 보인 \(shoesData.name), 나이키 에어를 장착한 최초의 농구화로 경기에 혁신을 일으키며 짧은 시간 내 전 세계적인 관심을 받았습니다.
                        스니커즈의 역사에 변화를 가져온 부드럽고 탄력 있는 쿠셔닝은 오늘날의 \(shoesData.name)에도 고스란히 전해지고 있습니다.
                        """)
                            .padding(.vertical, 8)

                }
                .padding()
                .navigationTitle("상품 상세 정보 보기")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                // back버튼
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                        }
                        
                    }
                }
            }
        }
    }
}

struct ProductDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailInfoView(shoesData: detailSample)
    }
}
