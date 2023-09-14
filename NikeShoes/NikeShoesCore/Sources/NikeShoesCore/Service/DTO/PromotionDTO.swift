//
//  PromotionDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

public struct PromotionDTO: Codable, Identifiable {
    @DocumentID public var id: String?
    public var code: String
    public var discountRate: Double // 10 %
    public var restrict: Int // 10개 제한
    public var promotionExpireDate: Date
    
   public init(id: String? = nil, code: String, discountRate: Double, restrict: Int, promotionExpireDate: Date) {
        self.id = id
        self.code = code
        self.discountRate = discountRate
        self.restrict = restrict
        self.promotionExpireDate = promotionExpireDate
    }
}


