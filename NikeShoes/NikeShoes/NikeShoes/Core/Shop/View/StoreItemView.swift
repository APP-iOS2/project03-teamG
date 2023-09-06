//
//  ShopLocationItemView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI

struct StoreItemView: View {
    
    var store: StoreData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(store.name)
                .font(Font.medium20)
            Text(store.district)
                .foregroundColor(.gray)
            Text(store.city)
                .foregroundColor(.gray)
            Text(store.detailAddress)
                .foregroundColor(.gray)
            // 영업종료일 경우
            if store.operationTime > store.terminatedTime {
                HStack {
                    Text("영업 종료")
                        .foregroundColor(.nikeRed)
                    Text("- 영업 시작 \(store.openingTime)")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
                // 영업시간일 경우
            } else if store.operationTime > store.openingTime {
                HStack {
                    Text("영업 중")
                        .foregroundColor(.nikeGreen)
                    Text("- 영업 종료 \(store.terminatedTime)")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
                // 영업시작 전일 경우
            } else if store.operationTime < store.openingTime {
                HStack {
                    Text("영업 전")
                        .foregroundColor(.nikeRed)
                    Text("- 영업 시작 \(store.openingTime)")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
            }
        }
        .padding()
        .frame(width: 350, alignment: .leading)
        .background(.white)
        .border(Color.defaultGray, width: 3)
        .cornerRadius(4)
        
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(store: StoreData(name: "나이키 롯데 동탄", district: "경기도", city: "화성시", detailAddress: "동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시 30분", terminatedTime: "오후 22시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()))
    }
}
