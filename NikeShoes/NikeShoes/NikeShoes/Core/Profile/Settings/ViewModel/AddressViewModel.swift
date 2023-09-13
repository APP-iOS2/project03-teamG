import Foundation
import Firebase
import NikeShoesCore

class AddressViewModel: ObservableObject {
    
    private let firestoreService = DefaultFireStoreService()
    
    @Published var addresses: [AddressDTO] = [sample]
    
    func addAddress(address: AddressDTO) async {
        do {
            guard let userID = Auth.auth().currentUser?.uid else {
                print("No user ID available")
                return
            }

            addresses.append(address)
            try await firestoreService.update(collection: .user, document: userID, fields: ["addresses": addresses])
            print("Successfully added address")
        } catch {
            print("Failed to add address: \(error)")
        }
    }
    
    func fetchAddresses() async {
        do {
            guard let userID = Auth.auth().currentUser?.uid else {
                print("No user ID available")
                return
            }

            let user: [UserDTO] = try await firestoreService.fetchAll(collection: .user, query: .equal("id", userID))
            addresses = user[0].address
            print(addresses)
        } catch {
            print("Failed to fetch addresses: \(error)")
        }
    }
    
    func updateAddress(address: AddressDTO) async {
        do {
            guard let userID = Auth.auth().currentUser?.uid else {
                print("No user ID available")
                return
            }

            if let index = addresses.firstIndex(where: { $0.id == address.id }) {
                addresses[index] = address
                try await firestoreService.update(collection: .user, document: userID, fields: ["addresses": addresses])
                print("Successfully updated address")
            }
        } catch {
            print("Failed to update address: \(error)")
        }
    }
    
    func deleteAddress(address: AddressDTO) async {
        do {
            guard let userID = Auth.auth().currentUser?.uid else {
                print("No user ID available")
                return
            }

            addresses.removeAll { $0.id == address.id }
            try await firestoreService.update(collection: .user, document: userID, fields: ["addresses": addresses])
            print("Successfully deleted address")
        } catch {
            print("Failed to delete address: \(error)")
        }
    }
}

let sample = AddressDTO(
    id: "12345",
    name: "희찬",
    city: "서울",
    district: "강남구",
    town: "삼성동",
    fullAddress: "서울특별시 강남구 삼성동 123-45",
    postalCode: "06164",
    phoneNumber: "010-1234-5678",
    country: "대한민국",
    isDefault: true
)
