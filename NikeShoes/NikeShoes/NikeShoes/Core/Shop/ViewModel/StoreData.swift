//
//  Location.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import Foundation

struct StoreData: Identifiable, ImageURL, Equatable {
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
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.amSymbol = "오전"
        dateFormatter.pmSymbol = "오후"
        return dateFormatter.string(from: now)
    }
}
