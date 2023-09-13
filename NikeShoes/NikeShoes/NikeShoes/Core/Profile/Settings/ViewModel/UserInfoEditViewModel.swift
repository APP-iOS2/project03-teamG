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
    @Published var email = ""
    private let firestoreService = DefaultFireStoreService()
    private var db = Firestore.firestore()
    
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
        print(userID)
        do {
            try await firestoreService.update(collection: .user, document: userID, fields: ["phoneNumber": newPhoneNumber])
            print("Successfully updated phone number")
        } catch {
            print("Failed to update phone number: \(error)")
        }
    }
    
    func fetchEmail() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        db.collection("user").document(userID).getDocument { (document, error) in
            if let email = try? document?.data()?["email"] as? String {
                self.email = email
            } else {
                print(userID)
                print("User not found: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
}
