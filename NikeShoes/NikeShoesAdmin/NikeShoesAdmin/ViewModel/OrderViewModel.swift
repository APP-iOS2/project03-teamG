//
//  OrderViewModel.swift
//  NikeShoesAdmin
//
//  Created by 여성은 on 2023/09/12.
//

import Foundation
import FirebaseFirestore
import NikeShoesCore

class OrderViewModel: ObservableObject {
    
    let service: FirestoreService
    
    @Published var orderArray: [OrderDTO] = []
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        
        orderArray = [
            OrderDTO(id: "1", shoesID: "에어포스230WH", userID: "dutjddms", address: "서울시 어디구 어느동", deliveryStatus: "배송 전", paymentStatus: "입금 대기", orderDate: Date()),
            OrderDTO(id: "2", shoesID: "코르테즈265NV", userID: "아샷츙", address: "부산시 어디구 어디동", deliveryStatus: "출고 완료", paymentStatus: "입금 확인", orderDate: Date()),
            OrderDTO(id: "3", shoesID: "조던280BK", userID: "아샷츙", address: "서울시 어쩌구 저쩌동", deliveryStatus: "배송 중", paymentStatus: "입금 확인", orderDate: Date())
        ]
    }

    func fetchOrder() async throws -> [OrderDTO] {
        let valuse: [OrderDTO] = try await service.fetchAll(collection: .orderlist, query: nil)
        
        return valuse
    }
    
    func updateOrder(id: String, paymentStatus: String, deliveryStatus: String) async throws {
        try await service.update(collection: .orderlist, document: id, fields: ["paymentStatus" : paymentStatus, "deliveryStatus" : deliveryStatus])
    }

}

/*
 public struct OrderDTO: Codable {
     @DocumentID public var id: String?
     public let shoesID: String
     public let userID: String
     public var deliveryStatus: String
     public var paymentStatus: String
     public let orderDate: Date
 }
 
 struct Ordered: Identifiable {
     var id: UUID = UUID()
     var userId: String
     var productId: String
     var orderDate: String
     var paymentComplete: Bool
     var address: String
 }
 
 var orderArray: [Ordered] = [
     Ordered(userId: "성은띠", productId: "에어포스어쩌구235", orderDate: "2023-09-12", paymentComplete: false, address: "서울시 강서구 어쩌구"),
     Ordered(userId: "뚜디오스", productId: "조던PINK225", orderDate: "2023-08-31", paymentComplete: true, address: "서울시 동작구 어쩌구"),
     Ordered(userId: "소뎡소뎡", productId: "덩크로우240", orderDate: "2023-09-10", paymentComplete: false, address: "서울시 서대문구 어쩌구"),
     Ordered(userId: "팀짱형쭌", productId: "코르테즈BLUE275", orderDate: "2023-09-12", paymentComplete: true, address: "서울시 어디구 어쩌동"),
 ]
 
 public init(id: String? = nil,
                 shoesID: String,
                 userID: String,
                 deliveryStatus: String,
                 paymentStatus: String,
                 orderDate: Date) {
         self.id = id
         self.shoesID = shoesID
         self.userID = userID
         self.deliveryStatus = deliveryStatus
         self.paymentStatus = paymentStatus
         self.orderDate = orderDate
     }
 
 class VM: ObservableObject {
     
     let service: FirestoreService
     
     @Published var orders: [OrderDTO] = []
     
     init(service: FirestoreService = DefaultFireStoreService()) {
         self.service = service
     }
     
     func fetchOrders() async throws -> [OrderDTO] {
         let values: [OrderDTO] = try await service.fetchAll(collection: .orderlist, query: nil)
         
         
         return values
     }
     
 }
 */
