//
//  OnBoarding.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var obViewModel: OBViewModel
    
    var body: some View {
        
        VStack {
            OBContainerView()
                .navigationBarBackButtonHidden(true)
        } // VStack
        
    }
}

struct OBContainerView: View {
    
    @State private var isButtonClicked: Bool = false
    @State private var index: Int = 0
    
    private let duration: Double = 0.5
    
    var body: some View {
        ZStack {
            if isImageAppearView {
                imageBackground
                blurView
            } else {
                background
            }
            VStack {
                if isOnBoardingView,
                   isImageAppearView {
                    progressView
                }
                // index가 OnBoarding의 끝나는 지점에 transitionView -> MainTabView 로 변경
                transitionView
            }
        }
    }
    
    private var isImageAppearView: Bool {
        index != 1 && index != 0
    }
    
    private var isOnBoardingView: Bool {
        index < 7
    }
    
    private var onBoardingCount: Int {
        7
    }
    
    @ViewBuilder
    private var transitionView: some View {
        switch OBScreen(rawValue: index) {
            
        case .locationDescription:
            OBLocationDescriptionView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
            
        case .languageSelection:
            OBLanguageSelectionView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0)))
            
        case .getStated:
            OBStartView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
            
        case .interest:
            OBInterestSelectView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
            
        case .sizeSelection:
            OBShoesSizeSelectView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
            
        case .alarmSelection:
            OBAlarmView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
            
        case .location:
            OBLocationView(index: $index)
                .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
            
        case .mainTab:
            MainTabView()
            
        case .none:
            fatalError("this is invalid index")
        }
    }
    
    private var background: some View {
        Color.black.ignoresSafeArea()
    }
    
    private var imageBackground: some View {
       Image("nike_back")
            .resizable()
            .ignoresSafeArea()
    }
    
    private var progressView: some View {
        HStack {
            ProgressView(value: Double(index),
                         total: Double(7))
            .background(.gray)
            .tint(.white)
            .cornerRadius(12)
            .padding(.top, 10)
            .padding(.horizontal, 80)
        }
    }
    
    private var blurView: some View {
        Blur(style: .systemUltraThinMaterialDark)
            .ignoresSafeArea()
    }
}

typealias OBScreen = OBContainerView.OnBoardingScreen

extension OBContainerView {
    enum OnBoardingScreen: Int, CaseIterable, Identifiable {
        
        case locationDescription = 0
        case languageSelection
        case getStated
        case interest
        case sizeSelection
        case alarmSelection
        case location
        case mainTab
        
        var title: String {
            switch self {
            case .locationDescription:
                return "다음"
            case .languageSelection:
                return "다음"
            case .getStated:
                return "시작"
            case .interest:
                return "다음"
            case .sizeSelection:
                return "다음"
            case .alarmSelection:
                return "다음"
            case .location:
                return "다음"
            case .mainTab:
                return ""
            }
        }
        
        var id: Self {
            self
        }
    }
}

struct OBView_Previews: PreviewProvider {
    static var previews: some View {
        OBView()
            .environmentObject(OBViewModel(service: ViewModelFactory.shared.makeService()))
    }
}
