//
//  OrderViewModel.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/13.
//

import Foundation
import NikeShoesCore
import Firebase

class OrderViewModel: ObservableObject {
    
    let service: FirestoreService
    
    @Published var userData: UserDTO?
    @Published var orderData: [OrderDTO]?
    @Published var shoesData: [ShoesDTO]?
    @Published var addressData: [AddressDTO]?
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
//        action()
    }
    
    // gudghksss@sksjdkdk.cic로 테스트
    // test@icloud.com
    @MainActor
        func fetchUserData() async throws {
            guard let userID = Auth.auth().currentUser?.email else {
                        print("No user ID available")
                        return
                    }
            do {
                let values: [UserDTO] = try await service.fetchAll(collection: .user, query: .equal("email", userID))
                print("===========debug===========")
                print(values)
                self.userData = values.first
            } catch {
                throw error
            }
        }
    
    @MainActor
        func fetchOrderData() async throws {
            do {
                if let userData = userData?.id {
                    let values: [OrderDTO] = try await service.fetchAll(collection: .orderlist, query: .equal("userID", userData))
                    print("===========debug===========")
                    print(values)
                    self.orderData = values
                }
            } catch {
                print(error)
            }
        }
    
    @MainActor
        func fetchShoesData() async throws {
            guard let orders = orderData else {
                self.shoesData = []
                return
            }
            
            do {
                var fetchedShoesData: [ShoesDTO] = []
                for order in orders {
                    let shoe: ShoesDTO = try await service.fetchAllDocumet(collection: .shoes, documentid: order.shoesID)
                    fetchedShoesData.append(shoe)
                }
                self.shoesData = fetchedShoesData
            } catch {
                throw error
            }
        }


    @MainActor
        func fetchAddressData() async throws {
            do {
                if let orderData = orderData?.first?.shoesID {
                    let values: ShoesDTO = try await service.fetchAllDocumet(collection: .shoes, documentid: orderData)
                    print("===========debug===========")
                    print(values)
                    self.shoesData?.append(values)
                }
            } catch {
                throw error
            }
        }
    
    @MainActor
    func updateOrderCancel() async throws {
        do {
            if let id = orderData?.first?.id {
                try await service.update(collection: .orderlist, document: id, fields: ["deliveryStatus": "주문 취소"])
            }
        }
    }
    
    @MainActor
    func updateOrderComplete() async throws {
        do {
            if let id = orderData?.first?.id {
                try await service.update(collection: .orderlist, document: id, fields: ["deliveryStatus": "주문 완료"])
            }
        }
    }
    
    @MainActor
    func updatePaymentCancel() async throws {
        do {
            if let id = orderData?.first?.id {
                try await service.update(collection: .shoes, document: id, fields: ["price": 0])
            }
        }
    }
    
    func cancelOrderStatus() {
        orderData = orderData?.map { dto in
            var dto = dto
            dto.deliveryStatus = .orderCancel
            return dto
        }
    }
    
    func completeOrderStatus() {
        orderData = orderData?.map { dto in
            var dto = dto
            dto.deliveryStatus = .orderComplete
            return dto
        }
    }
    
    func cancelPaymentStatus() {
        shoesData = shoesData?.map { dto in
            var dto = dto
            dto.price = 0
            return dto
        }
    }
    
    @MainActor
    func fetchData() async throws {
        do {
            try await fetchUserData()
            try await fetchOrderData()
            try await fetchShoesData()
        } catch {
            throw error
        }
    }

    func toString(orderDate: Date) -> String {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.timeZone = TimeZone(abbreviation: "KST") // "2018-03-21 18:07"
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        return formatter.string(from: orderDate)
    }
    
    func createOrder(orderDTO: OrderDTO) async throws {
        do {
            let _: String = try await
            service.create(send: orderDTO, collection: .orderlist, document: nil, collection2: nil)
        } catch {
            throw error
        }
    }
}
