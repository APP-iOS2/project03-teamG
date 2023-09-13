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
    public var colors: [ProductColor]
    public var imageURLString: [String]
    public var speciality: [Speciality]
    public var stylingImage: [String]
    
    public init(
            id: String? = nil,
            name: String,
            category: String,
            modelName: String,
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

// MARK: ProductDetailView용 sample, 추후 삭제 예정
public let detailSample: ShoesDTO = ShoesDTO(name: "나이키 에어 포스 1 '07",
                                             category: "남성",
                                             modelName: "에어 포스 1",
                                             description: "빛이 그대로 살아 있는 나이키 에어 포스 1 ’07은 OG 농구화로서 많은 사랑을 받아온 디자인에 새로운 멋을 더했습니다.튼튼하게 스티치 처리된 오버레이와 깔끔한 마감 처리, 과하지 않은 절제된 화려함으로 빛나는 존재감을 발휘해 보세요.",
                                             price: 139000,
                                             size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
                                             colors: [.white, .black],
                                             imageURLString: [
                                                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/%EC%97%90%EC%96%B4-%ED%8F%AC%EC%8A%A4-1-07-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-TttlGpDb.png",
                                                "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/fc4622c4-2769-4665-aa6e-42c974a7705e/%EC%97%90%EC%96%B4-%ED%8F%AC%EC%8A%A4-1-07-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-TttlGpDb.png"
                                             ],
                                             speciality: [.hot],
                                             stylingImage: [
                                                "https://static.nike.com/a/images/t_prod/w_1920,c_limit,f_auto,q_auto/b16130df-9129-4334-824e-95bc7758ae34/pdp-cw2288-001.jpg",
                                                "https://static.nike.com/a/images/t_prod/w_1920,c_limit,f_auto,q_auto/bf03cb63-a736-4557-95bd-49e9d8714a05/pdp-cw2288-001.jpg"
                                             ])
