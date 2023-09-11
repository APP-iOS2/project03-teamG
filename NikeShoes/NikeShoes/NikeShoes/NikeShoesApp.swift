//
//  NikeShoesApp.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/04.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct NikeShoesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    private var followingViewModel: FollowingViewModel = FollowingViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(followingViewModel)
        }
    }
}
