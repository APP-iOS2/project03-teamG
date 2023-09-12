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
    
    @Published var shoes: [ShoesDTO] = []
    
    // Todo: db path 정의해서 만들기
    //
    // Todo: Service 쪽 generic으로 만들기

    // Todo: ViewModel 만들기
    //
    // Todo: ViewModel -> View로 데이터 바인딩
    //
    // Todo: 전체 앱에서 공유할 객체 정하기?
    
    init(service: FirestoreService = DefaultFireStoreService(), search: String) {
        self.service = service
        action()
        
    }
    
    func action() {
        Task {
            let shoes = try await fetchItems()
            self.shoes = shoes
        }
    }
    
    // MARK: 상품 리스트 가져오기
    func fetchItems() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
    func filtered(search: String) {
        //검색어에 해당하는 신발만이 배열에 들어가야 함
        //or 검색어에 해당하지 않으면 빠져야 함
        
        //인스턴스의 내용 중 하나라도 검생어에 해당이 되면 remove 안하기?
        
        //
        
    }
    
}
