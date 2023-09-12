//
//  NikeShoesAdminApp.swift
//  NikeShoesAdmin
//
//  Created by 최소정 on 2023/09/04.
//

import SwiftUI
import FirebaseCore

//import FirebaseFirestore
//import NikeShoesCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
    


//    func serviceLocator() -> FirestoreService {
//        return DefaultFireStoreService()
//    }
}

@main
struct NikeShoesAdminApp: App  {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    

    var body: some Scene {
        WindowGroup {
            PromotionView()
            
        }
    }
}
