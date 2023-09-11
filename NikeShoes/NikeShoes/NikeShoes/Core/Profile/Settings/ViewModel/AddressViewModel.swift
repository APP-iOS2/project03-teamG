//
//  AddressViewModel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/07.
//

import Foundation
import Firebase

class AddressViewModel: ObservableObject {
    @Published var addresses: [AddressDTO] = []
    
    private var db = Firestore.firestore()
    
    func addAddress(address: AddressDTO) {
        do {
            if address.isDefault {
                if let currentDefault = addresses.first(where: { $0.isDefault }) {
                    var updatedAddress = currentDefault
                    updatedAddress.isDefault = false
                    try db.collection("addresses").document(currentDefault.id ?? "").setData(from: updatedAddress)
                }
            }
            let _ = try db.collection("users").document(Auth.auth().currentUser!.uid) .collection("addresses").addDocument(from: address)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchData() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        db.collection("users").document(userID).collection("addresses").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.addresses = documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: AddressDTO.self)
            }
        }
    }
    
    func updateAddress(address: AddressDTO) {
        guard let addressID = address.id else {
            print("No address ID available")
            return
        }
        
        do {
            try db.collection("users").document(Auth.auth().currentUser!.uid)
                .collection("addresses").document(addressID)
                .setData(from: address)
        } catch let error {
            print("Error updating address: \(error)")
        }
    }
    
    func setAsDefault(address: AddressDTO) {
        if address.isDefault {
            // 기존 기본 배송지 해제
            if let currentDefault = addresses.first(where: { $0.isDefault }) {
                var updatedAddress = currentDefault
                updatedAddress.isDefault = false
                updateAddress(address: updatedAddress)
            }
        }
        
        // 새로운 기본 배송지 설정
        updateAddress(address: address)
    }
    
}
