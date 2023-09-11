//
//  AuthViewmodel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/11.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
        
        print("DEBUG: User session: \(userSession)")
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: signIn Error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: signIn User successfully")
            
        }
    }
    
    func register(email: String,
                  password: String,
                  firstName: String,
                  lastName: String,
                  country: String,
                  phoneNumber: String,
                  birth: Date) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error registering new user: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Registered User successfully")
            
            let data = ["email": email,
                        "firstName": firstName,
                        "lastName": lastName,
                        "country": country,
                        "phoneNumber": phoneNumber,
                        "birth": birth]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data")
                }
            
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
        Firestore.firestore().collection("users").document(uid).delete { error in
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
