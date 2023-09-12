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
    public var category: Gender   // Gender : 남성, 여성, 키즈 ,(공용)
    public var modelName: ModelName //  조던 에어 덩크 코르
    public var description: String
    public var price: Int
    public var size: [Int]
    public var colors: [ProductColor]
    public var imageURLString: [String]
    public var speciality: [Speciality]
    public var stylingImage: [String]
    
    public init(
            id: String? = nil,
            name: String,
            category: Gender,
            modelName: ModelName,
            description: String,
            price: Int,
            size: [Int],
            colors: [ProductColor],
            imageURLString: [String],
            speciality: [Speciality],
            stylingImage: [String]
        ) {
            self.id = id
            self.name = name
            self.category = category
            self.modelName = modelName
            self.description = description
            self.price = price
            self.size = size
            self.colors = colors
            self.imageURLString = imageURLString
            self.speciality = speciality
            self.stylingImage = stylingImage
        }
}

public enum Gender: String, Codable, CaseIterable, Equatable {
    case male = "남성",
         female = "여성",
         kids = "키즈"
}

public enum ModelName: String, Codable, CaseIterable, Equatable {
    case jordan = "조던",
         dunk = "덩크",
         cortez = "코르테즈",
         airForce = "에어 포스 1"
}

public enum Speciality: String, Codable, CaseIterable, Equatable {
    case onlyApp
    case newProduct
    case hot
}

public enum ProductColor: String, Codable, CaseIterable, Equatable {
    case black
    case red
    case white
    case blue
    case green
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
