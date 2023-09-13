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
    
    // 내가 필요한거 다 불러오기..
    @Published var userData: UserDTO?
    @Published var orderData: [OrderDTO]?
    @Published var shoesData: [ShoesDTO]?
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
//        action()
    }
    
    // gudghksss@sksjdkdk.cic로 테스트
    //let values: [UserDTO] = try await service.fetchAll(collection: .user, query: .equal("email", "gudghksss@sksjdkdk.cic"))
    @MainActor
        func fetchUserData() async throws {
            // 로그인한 본인 계정에 대한 정보 가져옴
            guard let userID = Auth.auth().currentUser?.email else {
                        print("No user ID available")
                        return
                    }
            do {
                // 필드의 email을 가진 유저 -> 의 문서 해시 -> 가 그 user이다라고 그 유저에 대한 배열값들 할당 --> Xcode의 userData의 id에는 그 도큐먼트 해시 값이 들어가 있음
                let values: [UserDTO] = try await service.fetchAll(collection: .user, query: .equal("email", userID))
                print("===========debug===========")
                print(values)
                self.userData = values.first // 유저는 1
            } catch {
                throw error
            }
        }
    
    @MainActor
        func fetchOrderData() async throws {
            do {
                // 위에서 추출한 그 유저의 Xcode의 userData의 document id = firebase의 orderlist의 필드값인 userID 라고 값 할당
                if let userData = userData?.id {
                    let values: [OrderDTO] = try await service.fetchAll(collection: .orderlist, query: .equal("userID", userData))
                    print("===========debug===========")
                    print(values)
                    self.orderData = values // 여러개 주문
                }
            } catch {
                print(error)
            }
        }
    
    @MainActor
        func fetchShoesData() async throws {
            do {
                // orderlist필드의 shoesID의 해시로 (!=) shoes의 문서 해시를 찾아야하는데 어떻게 해야할지 모르겠음 -> shoes의 값을 전부 가져온다음 필터링?
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
    
    // 순서를 뷰에서 하거나(비동기라 위험 - 순서 꼬일 수도) 여기서해도 됨
    func fetchData() async throws {
        try await fetchUserData()
        try await fetchOrderData() // async로 선언했으니까 try
    }
}
