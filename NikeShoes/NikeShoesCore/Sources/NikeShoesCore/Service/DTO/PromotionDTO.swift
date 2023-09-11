//
//  PromotionDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

public struct PromotionDTO: Codable {
    @DocumentID public var id: String?
    public let code: String
    public let discountRate: Double // 10 %
    public let restrict: Int // 10개 제한
}
