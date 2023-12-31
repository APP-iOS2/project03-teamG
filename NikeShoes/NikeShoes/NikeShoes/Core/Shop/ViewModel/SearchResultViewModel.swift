//
//  ItemListViewModel.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
//

import Foundation
import NikeShoesCore

class SearchResultViewModel: ObservableObject {
    
    let service: FirestoreService
    let searchKeyword: String
    
    @Published var shoes: [ShoesDTO] = []
    
    init(service: FirestoreService = DefaultFireStoreService(), searchKeyword: String) {
        self.service = service
        self.searchKeyword = searchKeyword
        
        Task {
            await action()//fetch 후 배열에 반영
        }
    }
    
    @MainActor
    func action() {
        Task { // 비동기 작업 실행
            let shoes = try await fetchItems()
            self.shoes = shoes
            let filtered = try await filtered(search: searchKeyword)
            self.shoes = filtered
            print("Filtered : \(self.shoes)")
        }
    }
    
    // MARK: 상품 리스트 가져오기
    func fetchItems() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
    // MARK: 검색어를 기반으로 필터링을 해준다.
    func filtered(search: String) async throws -> [ShoesDTO] {
        
        //이름, 카테고리, 모델이름 기반으로 검색되게 만듬
        let filteredShoes = self.shoes.filter {
            $0.name.contains(search)
            || $0.category.contains(search)
            || $0.modelName.contains(search)
            || $0.speciality.contains(Speciality(rawValue: search) ?? .none)
        }
        return filteredShoes
    }
}
