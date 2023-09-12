//
//  ItemListViewModel.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
//

import Foundation
import NikeShoesCore

class SearchResultViewModel {
    
    
    
    let service: FirestoreService
    let searchKeyword: String
    
    @Published var shoes: [ShoesDTO] = []
    
    init(service: FirestoreService = DefaultFireStoreService(), searchKeyword: String) {
        self.service = service
        self.searchKeyword = searchKeyword
        action()//fetch 후 배열에 반영
    }
    
    func action() {
        Task {
            let shoes = try await fetchItems()
            print("\(shoes)")
            self.shoes = shoes
            let filtered = try await filtered(search: searchKeyword)
            self.shoes = filtered
            print("Filtered \(self.shoes)")
        }
    }
    
    // MARK: 상품 리스트 가져오기
    func fetchItems() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
    func filtered(search: String) async throws -> [ShoesDTO] {
        //검색어에 해당하는 신발만이 배열에 들어가야 함
        //or 검색어에 해당하지 않으면 빠져야 함
        
        //이름, 카테고리, 모델이름 기반으로 검색되게 만듬
        let filteredShoes = self.shoes.filter {
            $0.name.contains(search)
            || $0.category.contains(search)
            || $0.modelName.contains(search)
        }
        return filteredShoes
    }
    
//    public var name: String
//    public var category: String   // Gender : 남성, 여성, 키즈 ,(공용)
//    public var modelName: String //  조던 에어 덩크 코르
//    public var description: String
//    public var price: Int
//    public var size: [Int]
//    public var colors: [ProductColor]
//    public var imageURLString: [String]
//    public var speciality: [Speciality]
//    public var stylingImage: [String]
}
