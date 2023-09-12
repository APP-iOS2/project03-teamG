//
//  userInfoEditViewModel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/12.
//

import Foundation
import NikeShoesCore
import Firebase

class UserInfoEditViewModel: ObservableObject {
    private let firestoreService = DefaultFireStoreService()
    
    func updateEmail(newEmail: String) async {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        do {
            try await firestoreService.update(collection: .user, document: userID, fields: ["email": newEmail])
            print("Successfully updated email")
        } catch {
            print("Failed to update email: \(error)")
        }
    }
    
    func updatePhoneNumber(newPhoneNumber: String) async {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        do {
            try await firestoreService.update(collection: .user, document: userID, fields: ["phoneNumber": newPhoneNumber])
            print("Successfully updated phone number")
        } catch {
            print("Failed to update phone number: \(error)")
        }
    }
    
}
