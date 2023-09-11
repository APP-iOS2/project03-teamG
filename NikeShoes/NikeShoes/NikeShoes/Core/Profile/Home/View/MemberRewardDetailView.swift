//
//  MemberRewardDetailView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/05.
//

import SwiftUI

struct MemberRewardDetailView: View {
    var imageUrl: URL = URL(string: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg") ?? URL(string: "")!
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                ProfileAsyncImageView(imageUrl: imageUrl)
                    .edgesIgnoringSafeArea(.horizontal)
                VStack(alignment: .leading) {
                    Group {
                        Group {
                            Text("환영합니다!")
                                .font(.mediumBold24)
                            Text("나이키 멤버로 함께 할 여정을 응원합니다! ")
                                .font(.body)
                            Text("앱에서 첫 주문 시, 총 결제 금액에서 15% 할인이 적용됩니다.")
                        }
                        Group {
                            Text("[혜택 내용]")
                                .font(.medium20)
                                .bold()
                            Text("- 웰컴 프로모션 혜택: 앱 첫 구매 15% 할인 적용")
                                .font(.body)
                            Text("- 프로모션 코드 사용 가능 최대 금액: 300,000원 (최대 45,000할인)")
                                .font(.body)
                        }
                        Group {
                            Text("[유의 사항]")
                                .font(.medium20)
                                .bold()
                            Text("- 계정 당 1회 사용 가능")
                                .font(.body)
                            Text("- SNKRS, Apple Watch 관련 제품, 일부 앱 전용 제품 등을 제외한 전체 제품에 적용됩니다.")
                                .font(.body)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .padding(.horizontal, 20)
                
                Group {
                    CustomButton(background: .black, foregroundColor: .white, title: "신제품 바로가기") {
                    }
                    CustomButton(background: .black, foregroundColor: .white, title: "쿠폰 유의사항") {
                    }
                }
                .padding(.top, 10)
            }
        }
        .modifier(NavigationNikeSetting(title: ""))
        .preferredColorScheme(.light)
    }
}

struct MemberRewardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemberRewardDetailView()
    }
}
