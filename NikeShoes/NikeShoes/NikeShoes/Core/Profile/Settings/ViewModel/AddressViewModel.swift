//
//  AddressViewModel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/07.
//

import Foundation
import Firebase
import NikeShoesCore

class AddressViewModel: ObservableObject {
    @Published var addresses: [AddressDTO] = []
    
    private var db = Firestore.firestore()
    
    func addAddress(address: AddressDTO) async {
        do {
            if address.isDefault {
                if let currentDefault = addresses.first(where: { $0.isDefault }) {
                    var updatedAddress = currentDefault
                    updatedAddress.isDefault = false
                    try await updateAddress(address: updatedAddress)
                }
            }
            let _ = try db.collection("user").document(Auth.auth().currentUser!.uid)
                .collection("addresses").addDocument(from: address)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchData() async {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        do {
            let querySnapshot = try await db.collection("user").document(userID).collection("addresses").getDocuments()
            self.addresses = querySnapshot.documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: AddressDTO.self)
            }
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
    
    func updateAddress(address: AddressDTO) async throws {
        guard let addressID = address.id else {
            print("No address ID available")
            return
        }
        
        do {
            try db.collection("user").document(Auth.auth().currentUser!.uid)
                .collection("addresses").document(addressID)
                .setData(from: address)
        } catch let error {
            print("Error updating address: \(error)")
            throw error
        }
    }
    
    func setAsDefault(address: AddressDTO) async {
        do {
            if address.isDefault {
                if let currentDefault = addresses.first(where: { $0.isDefault }) {
                    var updatedAddress = currentDefault
                    updatedAddress.isDefault = false
                    try await updateAddress(address: updatedAddress)
                }
            }
            
            try await updateAddress(address: address)
        } catch {
            print("Failed to set as default: \(error)")
        }
    }
}

