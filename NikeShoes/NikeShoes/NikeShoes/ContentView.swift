//
//  ContentView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/04.
//

// MARK: if문으로 OnBoardingView() 띄우는 조건 만들기

import SwiftUI
import NikeShoesCore

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    

    var body: some View {
        if authViewModel.userSession != nil {
            if authViewModel.isLogin {
                MainTabView()
            } else {
                OBView()
            }
        } else {
            OnBoardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel(service: ViewModelFactory.shared.makeService()))

    }
}
