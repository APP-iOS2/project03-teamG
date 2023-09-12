//
//  ShoesDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

public struct ShoesDTO: Codable, Identifiable {
    @DocumentID public var id: String?
    public var name: String
    public var category: String   // Gender : 남성, 여성, 키즈 ,(공용)
    public var modelName: String //  조던 에어 덩크 코르
    public var description: String
    public var price: Int
    public var size: [Int]
    public var colors: [String]
    public var imageURLString: [String]
    public var speciality: [Speciality]
    public var stylingImage: [String]
}

public enum Gender: String, Codable {
    case male = "남성",
         female = "여성",
         kids = "키즈"
}

public enum ModelName: String, Codable {
    case jordan = "조던",
         dunk = "덩크",
         cortez = "코르테즈",
         airForce = "에어 포스 1"
}

public enum Speciality: String, Codable {
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
