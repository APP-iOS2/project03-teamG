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
        
        Task {
            try await fetchOrder()
//            await MainActor.run {
//                self.orderArray = orderArray
//            }
        }
    }
    @MainActor
    func fetchOrder() async throws {
        let values: [OrderDTO] = try await service.fetchAll(collection: .orderlist, query: nil)
        orderArray = values.sorted {
            $0.orderDate > $1.orderDate
        }

    }
    
    func updateOrder(id: String, deliveryStatus: DeliveryStatus.RawValue) async throws {
        try await service.update(collection: .orderlist, document: id, fields: ["deliveryStatus" : deliveryStatus])
        
        Task { try await self.fetchOrder() }
    }
    
    func createOrder(orderDTO: OrderDTO) async throws {
        do {
            let _: String = try await
            service.create(send: orderDTO, collection: .orderlist, document: nil, collection2: nil)
        } catch {
            throw error
        }
        
    }
    
    func sortOrderArray() {
        orderArray = orderArray.sorted {
            $0.orderDate > $1.orderDate
        }
    }
    
    func toString(orderDate: Date) -> String{
        let formatter: DateFormatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07"
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        return formatter.string(from: orderDate)
    }

    
}

