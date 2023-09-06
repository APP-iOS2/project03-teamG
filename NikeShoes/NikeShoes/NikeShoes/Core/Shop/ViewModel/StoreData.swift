//
//  Location.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import Foundation


struct StoreData: Identifiable, ImageURL {
    var id = UUID().uuidString
    var name: String
    var address: String
    var locationCoordinates: [Double]
    var storePhoneNumber: String
    var openingTime: String
    var terminatedTime: String
    var imageURLString: String
    
    var imageURL: URL {
        URL(string: imageURLString)!
    }
}

class StoreModel: ObservableObject {
    @Published var stores: [StoreData] = [
        StoreData(name: "나이키 롯데 동탄", address: "경기도 화성시 동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시 30분", terminatedTime: "오후 8시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg"),
        StoreData(name: "나이키 유나이트 용인", address: "경기도 용인시 기흥구 신고매로124 롯데프리미엄아울렛", locationCoordinates: [37.22518, 127.12067], storePhoneNumber: "+82 31 8036 3029", openingTime: "오전 10시 30분", terminatedTime: "오후 9시", imageURLString: "https://static.nike.com/a/images/f_auto/428e1194-21f3-434c-9730-40fd79ec602f/image.jpg"),
    
    ]
}
