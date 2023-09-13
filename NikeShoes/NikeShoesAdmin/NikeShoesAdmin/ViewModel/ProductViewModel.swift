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
            self.shoes = try await fetchShoes()
        } catch {
            throw error
        }
    }
    
    func deleteShoes(_ index: IndexSet) async throws -> String {
        let deleteItemId = index.map { self.shoes[$0].id ?? "" }.first
        #if DEBUG
        print("\(deleteItemId)")
        #endif
        if let id = deleteItemId {
            let delete: String = try await service.delete(collection: .shoes, document: id)
            shoes.remove(atOffsets: index)
        }
        return ""
    }
    
    func fetchShoes() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
    func updateShoes(id: String, shoesUpdateField: [String: Any]) async throws {
        do {
            try await service.update(collection: .shoes,
                                                     document: id,
                                                     fields: shoesUpdateField)
            
            self.shoes = try await fetchShoes()
        } catch {
            
        }
    }
    
}
