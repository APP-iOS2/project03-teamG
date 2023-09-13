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
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var userInfo: UserDTO
    @Published var userInfoCountry: String = ""
    @Published var userInfoPassword: String = ""
    @Published var isLogin: Bool = true
    
    private var db = Firestore.firestore()
    
    init(service: FirestoreService) {
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
            size: []
        )
        self.service = service
//        print("DEBUG: User session: \(String(describing: userSession))")
    }
    
    private let service: FirestoreService
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        db.collection("user").document(userID).getDocument { (document, error) in
            if let user = try? document?.data(as: UserDTO.self ){
                self.userInfo = user
            } else {
                print(userID)
                print("User not found: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func signIn(_ email: String, _ password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: signIn Error \(error.localizedDescription)")
                completion(false) // 로그인 실패 시 false 반환
                return
            }
            
            guard let user = result?.user else {
                completion(false) // 사용자가 nil일 경우 false 반환
                return
            }
            
            self.userSession = user
            print("DEBUG: signIn User successfully")
            completion(true) // 로그인 성공 시 true 반환
        }
    }
    
    @MainActor
    func registerUser() async -> Bool {
        do {
            let result = try await Auth.auth().createUser(withEmail: userInfo.email, password: userInfoPassword)
            self.userSession = result.user
            let debugResult = try await service.createDocument(send: userInfo, collection: .user, document: result.user.uid)
            return true
        } catch {
            print("registerUser : \(error)")
        }
        return false
    }
    
    @MainActor
    func deleteAccount() async throws {
        guard let user = Auth.auth().currentUser else { return }
        do {
            try await service.delete(collection: .user, document: user.uid)
            try await user.delete()
            self.signOut()
        } catch {
            print("deleteAccount error: \(error)")
            throw error
        }
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
    
    func isAlreadySignUp(_ email: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().fetchSignInMethods(forEmail: email) { signInMethods, error in
            if let error = error {
                let err = error as NSError
                
                switch err {
                case AuthErrorCode.emailAlreadyInUse:
                    completion(false, err)
                default:
                    print("unknown error: \(err.localizedDescription)")
                }
            } else {
                guard let signInMethods = signInMethods else {
                    return completion(false, nil)
                }
                completion(true, nil)
            }
        }
    }
    
    func resetPassword(forEmail email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                // 비밀번호 재설정 이메일 전송 중 오류가 발생한 경우
                completion(error)
            } else {
                // 비밀번호 재설정 이메일이 성공적으로 전송된 경우
                completion(nil)
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
