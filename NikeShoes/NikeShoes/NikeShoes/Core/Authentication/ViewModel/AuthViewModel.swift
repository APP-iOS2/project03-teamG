//
//  AuthViewmodel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/11.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import NikeShoesCore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var userInfo: UserDTO
    @Published var userInfoCountry: String = ""
    @Published var userInfoPassword: String = ""
    
    init() {
        userSession = Auth.auth().currentUser 
        userInfo = UserDTO(
            firstName: "",
            lastName: "",
            email: "",
            phoneNumber: "",
            dateOfBirth: "",
            memberReward: "",
            address: [],
            following: [],
            size: [],
            activityArea: "",
            introContent: ""
        )
        print("DEBUG: User session: \(String(describing: userSession))")
    }
    
    func signIn(_ email: String, _ password: String) -> Bool {
        var signInResult: Bool = false
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: signIn Error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: signIn User successfully")
            signInResult = true
        }
        
        return signInResult
    }
    
    func register() {
        Auth.auth().createUser(withEmail: userInfo.email, password: userInfoPassword) { result, error in
            if let error = error {
                print("DEBUG: Error registering new user: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user else { return }
            self.userSession = user

            print("DEBUG: Registered User successfully")

            let data: [String: Any] = [
                "firstName": self.userInfo.firstName,
                "lastName": self.userInfo.lastName,
                "email": self.userInfo.email,
                "phoneNumber": self.userInfo.phoneNumber,
                "dateOfBirth": self.userInfo.dateOfBirth,
                "country": self.userInfoCountry,
            ]

            Firestore.firestore().collection("user")
                .document(user.uid)
                .setData(data, merge: true)
        }
    }
    
    func isAlreadySignUp(_ email: String) async -> Bool {
        // TODO: document(userSession!.uid) 말고 전체 문서에 대한 데이터 접근 필요...
        do {
            let datas = try await Firestore.firestore().collection("user").document(userSession!.uid).getDocument()
            if let data = datas.data(), !data.isEmpty {
                if data["email"]! as! String == email {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        } catch {
            print("\(error.localizedDescription)")
            return false
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func deleteAccount() {
        guard let user = Auth.auth().currentUser else {
            print("DEBUG: No user is logged in")
            return
        }
        
        let uid = user.uid
        
        // Firestore에서 사용자 데이터 삭제
        Firestore.firestore().collection("user").document(uid).delete { error in
            if let error = error {
                print("DEBUG: Error deleting user data from Firestore: \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: User data deleted from Firestore")
            
            // Firebase Auth에서 사용자 계정 삭제
            user.delete { error in
                if let error = error {
                    print("DEBUG: Error deleting user account: \(error.localizedDescription)")
                    return
                }
                
                print("DEBUG: User account deleted")
                
                // 사용자 로그아웃
                self.signOut()
            }
        }
    }

}
