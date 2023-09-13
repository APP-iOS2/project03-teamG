//
//  MemberRewardViewModel.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/13.
//

import Foundation
import FirebaseFirestore
import NikeShoesCore

public class MemberRewardViewModel: ObservableObject {
    
    let service: FirestoreService
    
    @Published var memberReward: [PromotionDTO] = []
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        
        Task {
            let promotion = try await fetchPromotion()
            await MainActor.run {
                self.memberReward = promotion
            }
        }
        
    }

    
    func addPromotion(_ promotionDTO: PromotionDTO) async throws {
        do {
            let _: String = try await service.create(send: promotionDTO, collection: .promotion)
        } catch {
            throw error
        }
    }
    
    func deletePromotion(_ promotionDTO: PromotionDTO, id: String) async throws -> String {
        let delete: String = try await service.delete(collection: .promotion, document: id)
        return delete
    }
    
    func fetchPromotion() async throws -> [PromotionDTO] {
        let values: [PromotionDTO] = try await service.fetchAll(collection: .promotion, query: nil)
        return values
    }
    
    
}

