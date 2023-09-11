//
//  ShoesDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

struct ShoesDTO: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var category: Category   // Gender : 남성, 여성, 키즈 ,(공용)
    var modelName: ModelName //  조던 에어 덩크 코르
    var description: String
    var price: Int
    var size: [Int]
    var colors: [String]
    var imageURLString: [String]
    var speciality: [Speciality]
}

enum Category: String, Codable {
    case male = "남성",
         female = "여성",
         kids = "키즈"
}

enum ModelName: String, Codable {
    case jordan = "조던",
         dunk = "덩크",
         cortez = "코르테즈",
         airForce = "에어 포스 1"
}

enum Speciality: String, Codable {
    case onlyApp
    case newProduct
    case hot
}

//struct ModelNameDTO: Codable {
//    let modelName: ModelName
//
//    enum CodingKeys: String, CodingKey {
//        case modelName = "modelName"
//    }
//}

//struct SpecialityDTO: Codable {
//    let specialities: [Speciality]
//
//    enum CodingKeys: String, CodingKey {
//        case specialities = "specialities"
//    }
// }
//
//struct CategoryDTO: Codable {
//    let category: Category
//
//    enum CodingKeys: String, CodingKey {
//        case category = "category"
//    }
//}
