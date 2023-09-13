//
//  ViewModelFactory.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/12.
//

import Foundation
import NikeShoesCore

class ViewModelFactory {
    
    private let service: FirestoreService
    
    static let shared: ViewModelFactory = ViewModelFactory()
    
    private init() {
        self.service = DefaultFireStoreService()
    }
    
    func makeService() -> FirestoreService {
        return self.service
    }
}
