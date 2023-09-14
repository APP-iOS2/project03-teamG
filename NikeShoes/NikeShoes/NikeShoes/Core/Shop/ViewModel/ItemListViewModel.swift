//
//  ItemListViewModel.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
//

import Combine
import Foundation
import NikeShoesCore
import FirebaseAuth

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
    @Published var liked: [Bool] = []
    
    // 생성자
    init(service: FirestoreService) {
        self.service = service
    }
    
    // 액션 실행
    @MainActor
    func action() async {
        // 비동기 작업 실행
        do {
            let (shoes, liked) = try await fetchItems()
            self.shoes = shoes
            self.liked = liked
        } catch {
            print("APIError.fetchingError : \(shoes)")
        }
    }
    
    // Firestore로부터 상품 정보 가져오기
    func fetchItems() async throws -> ([ShoesDTO], [Bool]) {
        guard let userID = Auth.auth().currentUser?.uid else { throw APIError.didNotFoundID }
        let shoesDto: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        let dictionary: [String: DocumentRefID] = try await service.fetch(collection: .user, document: userID, collection: .user_like)
        let liked = shoesDto.map { value in
            if let id = value.id,
               dictionary.contains(where: { key, _ in key == id }) {
                return true
            } else {
                return false
            }
        }
        return (shoesDto, liked)
    }
}
