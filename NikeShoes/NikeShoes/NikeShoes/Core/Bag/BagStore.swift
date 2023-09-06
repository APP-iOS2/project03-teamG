//
//  BagStore.swift
//  NikeShoes
//
//  Created by Chloe Chung on 2023/09/05.
//

import Foundation

struct ProductInfo {
    var name: String
    var category: String
    var option: String
    var size: String
    var price: Int
//    var imageURL: String
}

struct PromotionCode {
    var code: String
    var discountRate: Double
}

var productInfo: [ProductInfo] = [
    ProductInfo(name: "에어 조던 1 로우", category: "여성 신발", option: "화이트/알루미늄/울프 그레이", size: "250 사이즈", price: 139000)
]

var defaultText: String = """
     장바구니가 비어있습니다.
제품을 추가하면 여기에 표시됩니다.
"""

var promotionCodes: [PromotionCode] = [
    PromotionCode(code: "할인50", discountRate: 0.5),
    PromotionCode(code: "할인40", discountRate: 0.4),
    PromotionCode(code: "할인30", discountRate: 0.3),
    PromotionCode(code: "할인20", discountRate: 0.2),
]
