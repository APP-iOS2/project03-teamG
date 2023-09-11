//
//  PromotionDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

struct PromotionDTO: Codable {
    @DocumentID var id: String?
    let code: String
    let discountRate: Double // 10 %
    let restrict: Int // 10개 제한
}
