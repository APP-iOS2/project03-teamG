//
//  OnBoarding.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI





struct OBView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                OBContainerView()
                    .navigationBarBackButtonHidden(true)
            }//VStack
        }
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
                   isImageAppearView{
                    progressView
                }
                // index가 OnBoarding의 끝나는 지점에 transitionView -> MainTabView 로 변경
                transitionView
                    .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                
                if isOnBoardingView {
                    TempButton(title: OnBoardingScreen(rawValue: index)?.title) {
                        index += 1
                    }.padding(.bottom, 20)
                }
            }
        }
    }
    
    private var imageURL: String = "https://static.nike.com/a/images/f_auto/f9b5ee1b-ea2d-4389-b296-1303680aafdd/image.png"
    
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
        switch OnBoardingScreen(rawValue: index) {
        case .locationDescription: OBLocationDescriptionView()
        case .languageSelection:  OBLanguageSelectionView()
        case .getStated:  OBStartView()
        case .interest:  OBInterestSelectView()
        case .sizeSelection:  OBShoesSizeSelectView()
        case .alarmSelection:  OBAlarmView()
        case .location:  OBLocationView()
        case .mainTab:  MainTabView()
        case .none:
            fatalError("this is invalid index")
        }
    }
    
    private var background: some View {
        Color.black.ignoresSafeArea()
    }
    
    
    private var imageBackground: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }.ignoresSafeArea()
    }
    
    private var progressView: some View {
        HStack {
            ProgressView(value: Double(index),
                         total: Double(7))
            .background(.gray)
            .tint(.white)
            .cornerRadius(12)
            .padding(.top,10)
            .padding(.horizontal,80)
        }
    }
    
    private var blurView: some View {
        Blur(style: .systemUltraThinMaterialDark)
            .ignoresSafeArea()
    }
}

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
    }
}

