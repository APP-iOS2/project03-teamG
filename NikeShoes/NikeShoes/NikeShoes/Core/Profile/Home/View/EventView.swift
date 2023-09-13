//
//  EventView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/13.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image("eventText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 30)
                
                HStack {
                    Image(systemName: "map")
                        .rectangleModifier()
                    
                    Text("모든 도시")
                        .rectangleModifier()
                }
                .padding(.leading, 20)
            }
            
            Divider()
                .padding(.top, 10)
                .padding(.bottom, 50)
            
            VStack(alignment: .leading) {
                Text("현재 예정된 나이키 글로벌 이벤트 일정이 없습니다.")
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("근처 도시에서 진행되는 나이키 이벤트가 있는지 검색해보세요.")
                
                Divider()
                    .padding(.vertical, 30)
                
                Text("정보를 놓치지 마세요.")
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("알림을 켜고 이벤트 초대와 최초 구매 혜택, 맞춤 혜택, 주문 업데이트 알림을 받아보세요.")
            }
            .padding(.bottom)
            .padding(.horizontal, 20)
            
            CustomButton(background: .black, foregroundColor: .white, title: "알림 켜기", action: {
                // action ...
            })
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: "이벤트"))
        .padding(.top, 50)
    }
}

extension View {
    func rectangleModifier() -> some View {
        return modifier(RectangleModifier())
    }
}

struct RectangleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
                    .background(.white)
            }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EventView()
        }
    }
}
