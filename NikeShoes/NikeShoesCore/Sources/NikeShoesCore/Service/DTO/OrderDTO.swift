//
//  OrderList.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

// 구매흐름
// 상품 선택 -> 장바구니 -> (프로모션 적용) -> 구매하기 -> 관리자앱 쪽에서 클라이언트가 구매한 물품을 볼수가 있게끔?
                  
// 일단 넘어가고     //(배송) - Time - 배송완료
// 결제 준비중 - 결제 완료 - 배송중 - 배송완료

// 관리자 쪽에서
// 배송 준비중 으로 바뀌겠죠
// 배송중 - 배송완료

public struct OrderDTO: Codable, Identifiable {
    @DocumentID public var id: String?
    public let shoesID: String
    public let userID: String
    public var address: String
    public var deliveryStatus: String
    public var paymentStatus: String
    public let orderDate: Date
    
    public init(id: String?,
                shoesID: String,
                userID: String,
                address: String,
                deliveryStatus: String,
                paymentStatus: String,
                orderDate: Date) {
        self.id = id
        self.shoesID = shoesID
        self.userID = userID
        self.address = address
        self.deliveryStatus = deliveryStatus
        self.paymentStatus = paymentStatus
        self.orderDate = orderDate
    }
}

