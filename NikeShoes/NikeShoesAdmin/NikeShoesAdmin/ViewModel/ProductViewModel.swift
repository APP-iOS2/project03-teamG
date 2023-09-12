//
//  ProductViewModel.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import Foundation
import NikeShoesCore

public class ProductViewModel: ObservableObject {
    
    let service: FirestoreService
    
    @Published var shoes: [ShoesDTO] = []
    
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        
        Task {
            let shoes = try await fetchShoes()
            await MainActor.run {
                self.shoes = shoes
            }
        }
        
    }
    
    //CRUD
    func addShoes(_ shoesDTO: ShoesDTO) async throws {
        do {
            let _: String = try await service.create(send: shoesDTO, collection: .shoes)
        } catch {
            throw error
        }
    }
    
    func deleteShoes(_ shoesDTO: ShoesDTO) async throws -> String {
        let delete: String = try await service.delete(collection: .shoes, document: "9JUAiEuwVy5SghynkTkr")
        return delete
    }
    
    func fetchShoes() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
//    func updateShoes() async throws {
//
//    }
    
}
