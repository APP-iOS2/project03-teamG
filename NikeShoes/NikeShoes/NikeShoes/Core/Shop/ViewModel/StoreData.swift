//
//  Location.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import Foundation


struct StoreData: Identifiable {
    var id = UUID().uuidString
    var name: String
    var address: String
    var locationCoordinates: [Double]
    var storePhoneNumber: String
    var openingTime: String
    var terminatedTime: String
}

class StoreModel: ObservableObject {
    @Published var stores: [StoreData] = [
        StoreData(name: "나이키 롯데 동탄", address: "경기도 화성시 동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시", terminatedTime: "오후 8시")
    
    ]
}
