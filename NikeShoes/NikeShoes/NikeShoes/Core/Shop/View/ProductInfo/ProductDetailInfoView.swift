//
//  ProductDetailInfoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/7/23.
//

import SwiftUI

struct ProductDetailInfoView: View {
    var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("전설적인 스타일, 새로운 감각.")
                            .font(.medium20)
                        Text("""
            
            빛이 그대로 살아 있는 나이키 에어 포스 1 ’07은 OG 농구화로서 많은 사랑을 받아온 디자인에 새로운 멋을 더했습니다. 
            튼튼하게 스티치 처리된 오버레이와 깔끔한 마감 처리, 과하지 않은 절제된 화려함으로 빛나는 존재감을 발휘해 보세요.
            
            """)
                        
                        Text("상품 특징")
                            .font(.medium20)
                        
                        Text("""
            
                   •    갑피의 스티치된 오버레이로 내구성과 지지력을 제공하며 헤리티지 스타일 선사
                   •    본래 퍼포먼스 농구화를 위해 고안된 나이키 에어 쿠셔닝이 온종일 가볍고 편안한 착화감 선사합니다.
                   •    로우컷 실루엣이 깔끔하고 매끈한 룩 연출
                   •    부드럽고 편안한 패딩 카라
            
            """)
            
                        Text("상품 상세 정보")
                            .font(.medium20)
            
                        Text("""
            
                   •    폼 중창
                   •    토의 천공 디테일
                   •    고무 밑창
            
            """)
            
                        Text("에어 포스 1에 대하여")
                            .font(.medium20)
                        
                        Text("""
            
            1982년에 첫선을 보인 AF1은 나이키 에어를 장착한 최초의 농구화로 경기에 혁신을 일으키며 짧은 시간 내 전 세계적인 관심을 받았습니다. 
            스니커즈의 역사에 변화를 가져온 부드럽고 탄력 있는 쿠셔닝은 오늘날의 에어 포스 1에도 고스란히 전해지고 있습니다.
            """)
                }
                .padding()
                .navigationTitle("상품 상세 정보 보기")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ProductDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailInfoView()
    }
}
