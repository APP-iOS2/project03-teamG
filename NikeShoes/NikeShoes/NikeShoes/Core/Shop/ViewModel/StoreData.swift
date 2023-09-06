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
    // 서울특별시, 경기도, ...
    var district: String
    // 시,군,구
    var city: String
    // 상세주소
    var detailAddress: String
    var locationCoordinates: [Double]
    var storePhoneNumber: String
    var openingTime: String
    var terminatedTime: String
    var imageURLString: String
    var now: Date
    
    var imageURL: URL {
        URL(string: imageURLString)!
    }
    
    var operationTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "a HH시 mm분"
        dateFormatter.amSymbol = "오전"
        dateFormatter.pmSymbol = "오후"
        return dateFormatter.string(from: now)
    }
}

// 뷰모델 파일 나누기
class StoreModel: ObservableObject {
    
    @Published var stores: [StoreData] = [
        StoreData(name: "나이키 롯데 동탄", district: "경기도", city: "화성시", detailAddress: "동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31-8036-3871", openingTime: "오전 10시 30분", terminatedTime: "오후 8시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 유나이트 용인", district: "경기도", city: "용인시", detailAddress: "기흥구 신고매로124 롯데프리미엄아울렛", locationCoordinates: [37.22518, 127.12067], storePhoneNumber: "+82 31-8036-3029", openingTime: "오전 10시 30분", terminatedTime: "오후 9시", imageURLString: "https://static.nike.com/a/images/f_auto/428e1194-21f3-434c-9730-40fd79ec602f/image.jpg", now: Date()),
        StoreData(name: "나이키 수원 망포", district: "경기도", city: "수원시", detailAddress: "영통구 덕영대로 1556번지 16 (영통동)", locationCoordinates: [37.24511, 127.05930], storePhoneNumber: "+82 31-203-1166", openingTime: "오전 10시 30분", terminatedTime: "오후 9시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 송탄", district: "경기도", city: "평택시", detailAddress: "쇼핑로 23-2", locationCoordinates: [37.08114, 127.05209], storePhoneNumber: "+82 31-662-2376", openingTime: "오전 10시", terminatedTime: "오후 10시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 영통", district: "경기도", city: "용인시", detailAddress: "기흥구 중부대로 64 용인프리미엄 C동 1층", locationCoordinates: [37.26676, 127.07621], storePhoneNumber: "+82 31-204-3456", openingTime: "오전 10시", terminatedTime: "오후 9시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
    
    ]
}
