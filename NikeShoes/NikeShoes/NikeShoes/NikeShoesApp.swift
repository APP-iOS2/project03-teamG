//
//  NikeShoesApp.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/04.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import NikeShoesCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    
    func serviceLocator() -> FirestoreService {
        return DefaultFireStoreService()
    }
}

@main
struct NikeShoesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    private var followingViewModel: FollowingViewModel = FollowingViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(followingViewModel)
        }
    }
}
