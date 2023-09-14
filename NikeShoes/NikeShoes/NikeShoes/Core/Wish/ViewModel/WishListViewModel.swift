//
//  WishListViewMO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/13.
//

import SwiftUI
import FirebaseAuth
import NikeShoesCore

extension ShoesDTO {
    func toLike() -> Shoes {
        Shoes(id: self.id,
              name: self.name,
              category: Gender(rawValue: self.category) ?? .male,
              modelName: ModelName(rawValue: self.modelName) ?? .airForce,
              price: self.price,
              size: self.size,
              description: self.description,
              imageURLString: self.imageURLString.first ?? "",
              like: true)
    }
}

class WishListViewModel: ObservableObject {
    @Published var shoesInfo: [Shoes] = []
    
    var shoesIds: [String: DocumentRefID] = [:]
    
    private var service: FirestoreService
    
    init(service: FirestoreService) {
        self.service = service
        
        Task {
            await fetchShoesLikeID()
        }
    }
    
    private func toggle(_ data: Shoes) { //좋아요를 토글해서 이미지로 반영되게 하는 방식
        for index in 0..<shoesInfo.count {
            if data.id == shoesInfo[index].id {
                shoesInfo[index].like.toggle()
            }
        }
    }
    
    struct ShoesLikeDTO: Codable {
        let shoesID: String
    }
    
    @MainActor
    func fetchLikeShoes() async {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        do {
            let value: [ShoesLikeDTO] = try await service.fetchAll(collection: .user, document: userID, collection: .user_like, query: nil)
            
            var shoesDTO: [ShoesDTO] = []
            
            for likeDto in value {
                let shoes: ShoesDTO = try await service.fetchDocument(collection: .shoes, document: likeDto.shoesID, query: nil)
                shoesDTO.append(shoes)
            }
            self.shoesInfo = shoesDTO.map { $0.toLike() }
            await fetchShoesLikeID()
            Log.debug(" 💡---fetchLikeShoes---: \(shoesDTO.last)---💡")
        } catch {
            Log.debug(" ❌--fetchLikeShoes---\(error)---❌")
        }
    }

    @MainActor
    func fetchShoesLikeID() async {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        do {
            self.shoesIds = try await service.fetch(collection: .user, document: userID, collection: .user_like)
        } catch {
            Log.debug(" ❌--fetchShoesLikeID---\(error)---❌")
        }
    }
    
    @MainActor
    func addShoes(to wishList: ShoesDTO) async throws {
        guard let userID = Auth.auth().currentUser?.uid,
              let shoesID = wishList.id
        else {
            try await Task.sleep(for: .milliseconds(1000)); throw APIError.didNotFoundID
        }
        
        let data = wishList.toLike()
        
        let likeDto = ShoesLikeDTO(shoesID: shoesID)
        
        shoesInfo.append(data)
        do {
            let value = try await service.create(send: likeDto, collection: .user, document: userID, collection2: .user_like)
            Log.debug("💡--addShoes--: \(value)---💡")
        } catch {
            shoesInfo.removeAll(where: { sh in sh.id == data.id })
            Log.debug(" ❌--likeUpdate---\(error)---❌")
        }
    }
    
    @MainActor
    func likeUpdate(shoes: Shoes) async throws {
        guard
            let userID = Auth.auth().currentUser?.uid,
            let id = shoes.id
        else {
            try await Task.sleep(for: .milliseconds(1000)); throw APIError.didNotFoundID
        }
        
        toggle(shoes) // heart 바꿔주기
        
        let likeDto = ShoesLikeDTO(shoesID: id)
        
        do {
            let value = try await service.create(send: likeDto, collection: .user, document: userID, collection2: .user_like)
            Log.debug("💡--likeUpdate--: \(value)---💡")
        } catch {
            Log.debug(" ❌--likeUpdate---\(error)---❌")
            // 서버에서 전송 실패시 다시 원래대로 return
            toggle(shoes) // heart 바꿔주기
            throw error
        }
    }
    
    @MainActor
    func unLikeShoes(shoes: Shoes) async throws {
        guard
            let userID = Auth.auth().currentUser?.uid,
            let shoesID = shoes.id,
            let documentID = shoesIds[shoesID]
        else {
            try await Task.sleep(for: .milliseconds(1000)); throw APIError.didNotFoundID
        }
        
        toggle(shoes) // heart 바꿔주기
        let value = shoesIds.removeValue(forKey: shoesID)
        do {
            try await service.delete(collection: .user, document: userID, collection: .user_like, document: documentID)
            Log.debug("💡---unLikeShoes---: \(shoes) deleted success---💡")
        } catch {
            
            Log.debug("❌--unLikeShoes---\(error)---❌")
            // 서버에 전송 실패시 다시 원래대로 return
            toggle(shoes)
            shoesIds[shoesID] = value
            throw error
        }
    }
}

struct Log {
    static func `debug`(_ message: String) {
#if DEBUG
        print(message)
#endif
    }
}

struct Dummy {
    static var dummy = [
        Shoes(name: "에어 조던 1 미드",
              category: .male,
              modelName: .jordan,
              price: 159000,
              size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
              description: "오리지널 AJ1에서 영감을 받은 이 미드 탑 에디션은 모두가 사랑하는 아이코닉한 스타일을 유지하면서 다양한 색상과 산뜻한 가죽으로 독특한 개성을 표현합니다.",
              imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/385588b7-b56c-4814-8d6c-b373e5530c5b/%EC%97%90%EC%96%B4-%EC%A1%B0%EB%8D%98-1-%EB%AF%B8%EB%93%9C-%EC%8B%A0%EB%B0%9C-AEOS7OZl.png",
              like: true),
        
        Shoes(name: "나이키 에어 포스 1 '07",
              category: .male,
              modelName: .airForce,
              price: 139000,
              size: [240, 245, 250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
              description: "빛이 그대로 살아 있는 나이키 에어 포스 1 ’07은 OG 농구화로서 많은 사랑을 받아온 디자인에 새로운 멋을 더했습니다.튼튼하게 스티치 처리된 오버레이와 깔끔한 마감 처리, 과하지 않은 절제된 화려함으로 빛나는 존재감을 발휘해 보세요.",
              imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-mens-shoes-jBrhbr.png",
              like: true),
        
        Shoes(name: "나이키 덩크 로우",
              category: .kids,
              modelName: .dunk,
              price: 119000,
              size: [225, 230, 235, 240, 245, 250],
              description: "농구 역사의 전설. 스케이트보딩계의 아이콘. 덩크는 수십 년간 다양한 스포츠 문화에서 많은 사랑을 받아왔습니다. 내구성 좋은 가죽 디자인에서 클래식한 형태와 착화감에 이르기까지, 새로운 세대의 마음을 사로잡을 80년대 감성의 신발을 재현했습니다.",
              imageURLString: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/a3e7dead-1ad2-4c40-996d-93ebc9df0fca/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EB%A0%88%ED%8A%B8%EB%A1%9C-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-bDdzzUjf.png",
              like: true),
        
        Shoes(name: "나이키 코르테즈 SE",
              category: .female,
              modelName: .cortez,
              price: 129000,
              size: [220, 225, 230, 235, 240, 245, 250, 255, 260],
              description: "코르테즈 SE가 아이코닉한 트랙 스타일을 밤에 어울리는 감각으로 재현했습니다. 산뜻한 가죽과 헤링본 밑창으로 완성된 이 제품은 많은 사랑을 받은 오리지널 제품과 동일한 디자인 라인이 적용되었습니다. 어둠 속에서 빛을 발하는 스우시 로고 덕에 밤이 되면 더욱 근사해지는 스페셜 에디션 스니커즈입니다.",
              imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/25ce0133-30c9-448d-9ca9-600f4175fb7c/%EC%BD%94%EB%A5%B4%ED%85%8C%EC%A6%88-se-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-NrNRnFf1.png",
              like: true),
    ]
}
