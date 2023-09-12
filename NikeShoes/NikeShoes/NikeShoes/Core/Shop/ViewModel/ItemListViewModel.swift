//
//  ItemListViewModel.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
//

import Combine
import Foundation
import NikeShoesCore

// Todo: db path 정의해서 만들기
// Todo: Service 쪽 generic으로 만들기
// Todo: ViewModel 만들기
// Todo: ViewModel -> View로 데이터 바인딩
// Todo: 전체 앱에서 공유할 객체 정하기?

class ItemListViewModel: ObservableObject {
    
    // Firestore 서비스
    let service: FirestoreService
    
    // 상품 데이터
    @Published var shoes: [ShoesDTO] = []
    
    // 생성자
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        action()
    }
    
    // 액션 실행
    func action() {
        // 비동기 작업 실행
        Task {
            do {
                let fetchedShoes = try await fetchItems()
                // 메인 스레드에서만 UI 업데이트
                DispatchQueue.main.async {
                    self.shoes = fetchedShoes
                }
            } catch {
                // 에러 처리
                print("Error fetching items: \(error)")
            }
        }
    }
    
    // Firestore로부터 상품 정보 가져오기
    func fetchItems() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
}
