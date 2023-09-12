//
//  ItemListViewModel.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
//

import Foundation

import Foundation
import NikeShoesCore

class ItemListViewModel {
    
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
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        action()
    }
    
    func action() {
        Task {
            let shoes = try await fetchItems()
            print("shoes : \(shoes)")
        }
    }
    
    // MARK: 상품 리스트 가져오기
    func fetchItems() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        print("values \(values)")
        return values
    }
    
}
