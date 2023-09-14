//
//  CustomRecoViewModel.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/14.
//

import Foundation
import NikeShoesCore

class CustomizedRecommendViewModel: ObservableObject {
    
    let service: FirestoreService
    
    @Published var shoes: [ShoesDTO] = []
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        
        Task {
            await action()//fetch 후 배열에 반영
            self.shoes = try await fetchItems()
        }
    }
    
    @MainActor
    func action() {
        Task { // 비동기 작업 실행
            let shoes = try await fetchItems()
            self.shoes = shoes
            let filtered = try await recommended()
            self.shoes = filtered
            print("Filtered : \(self.shoes)")
        }
    }
    
    // MARK: 상품 리스트 가져오기
    func fetchItems() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
    // MARK: 4개의 추천 제품을 잘라서 만들어 준다.
    func recommended() async throws -> [ShoesDTO] {
        if self.shoes.count > 3 {
            var recommendedShoes: [ShoesDTO] = []
            for index in 0...3 {
                recommendedShoes.append(self.shoes[index])
            }
            return recommendedShoes
        } else {
            return self.shoes
        }
    }
}
