//
//  OBViewModel.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/12.
//

import Foundation
import NikeShoesCore
import FirebaseAuth

final class OBViewModel: ObservableObject {
    
    private let service: FirestoreService
    
    init(service: FirestoreService) {
        self.service = service
    }
    
    func updateMyShoesSize(sizes: [Int]) async {
        guard let user_uid = Auth.auth().currentUser?.uid else { return }
        do {
            try await service.update(collection: .user, document: user_uid, fields: ["size": sizes])
            Log.debug(" 💡---updateInterest---: \(sizes)---💡")
        } catch {
            Log.debug(" ❌--updateInterest---\(error)---❌")
        }
    }
    
    func updateInterest(interest: [Following]) async {
        guard let user_uid = Auth.auth().currentUser?.uid else { return }
        
        _ = interest.map { FollowingDTO(title: $0.title, imageURL: $0.imageURL) }
        
        do {
            for dto in interest {
                _ = try await service.create(send: dto,
                                             collection: .user,
                                             document: user_uid,
                                             collection2: .user_following)
            }
            Log.debug(" 💡---updateInterest---: \(interest)---💡")
        } catch {
            Log.debug(" ❌--updateInterest---\(error)---❌")
        }
    }
    
    func updateLocation() async {
        // 윛
    }
    
    func updateLanguage() async {
        // 언어선택 한국어만 할거라서 필요없어 보임..
    }
    
}
