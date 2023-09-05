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
                .font(.system(size: 20))
            Text(store.address)
                .foregroundColor(.gray)
            Text("영업 시작 \(store.openingTime) - 영업 종료 \(store.terminatedTime)")
                .foregroundColor(.gray)
                .font(.system(size: 16))
        }
        .padding()
        .border(.gray, width: 2)
        .cornerRadius(3)
        
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(store: StoreData(name: "나이키 롯데 동탄", address: "경기도 화성시 동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시", terminatedTime: "오후 8시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg"))
    }
}
