//
//  OnBoardingView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct OnBoardingView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            RegisterContainerView(screen: .loginRegister)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct RegisterContainerView: View {
    @State private var isShowingSignInSheet: Bool = false
    @State private var screen: LoginRegisterScreen = .loginRegister
    
    init(screen: LoginRegisterScreen) {
        self.screen = screen
    }
    
    @State private var imageIndex: Int = 0
    
    private var images: [String] = [
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1061,c_limit/b3baaff5-7a0c-46af-9648-2759222e4127/%EB%86%8D%EA%B5%AC-%EC%BD%94%ED%8A%B8%EA%B0%80-%EC%9E%88%EB%8A%94-%EA%B3%B3%EC%9D%B4-%EC%9A%B0%EB%A6%AC-%EC%A7%91.jpg",
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_525,c_limit/da98d69b-ae45-4748-b1f6-97cea857a26e/%EB%82%98%EB%A7%8C%EC%9D%98-%EB%9F%AC%EB%8B%9D-%EC%8A%A4%ED%83%80%EC%9D%BC-%EA%B0%80%EC%9D%B4%EB%93%9C.jpg",
        "https://static.nike.com/a/images/w_765,c_limit/8637c195-4e29-4b15-9718-ab57813478b7/%EB%82%98%EB%A7%8C%EC%9D%98-%EB%9F%AC%EB%8B%9D-%EC%8A%A4%ED%83%80%EC%9D%BC-%EA%B0%80%EC%9D%B4%EB%93%9C.jpg",
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_765,c_limit/13d84f49-1f19-4f0c-82db-16781a511ced/%EB%82%98%EB%A7%8C%EC%9D%98-%EB%9F%AC%EB%8B%9D-%EC%8A%A4%ED%83%80%EC%9D%BC-%EA%B0%80%EC%9D%B4%EB%93%9C.jpg",
    ]
    
    var body: some View {
        ZStack {
            if screen == .loginCompleted {
                OBView()
            } else {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Image("nikeWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90)
                        .padding(.bottom, 40)
                    
                    HStack {
                        Text("나이키\n멤버에게\n최고의 제품,\n스포츠에 대한 영감과 스토리를\n소개합니다.")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .lineSpacing(6)
                            .padding(.bottom, 30)
                        Spacer()
                    }
                    
                    HStack {
                        SignUpButton
                        SignInButton
                    }
                }
                .padding(.leading, 20)
                .padding(.bottom, 70)
                .background(imageBackground)
            }
        }
        .sheet(isPresented: $isShowingSignInSheet) {
            SheetConatinerView
        }
    }
    
    private var SheetConatinerView: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Image("nikeJordan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120)
                    .padding([.leading, .bottom])
                
                switch screen {
                case .loginRegister:
                    LoginRegisterView(screen: $screen)
                        .signInToolbarStyle(screen: $screen, isShowingSignInSheet: $isShowingSignInSheet)
                case .termsOfService:
                    TermsOfServiceView(screen: $screen)
                        .signInToolbarStyle(screen: $screen, isShowingSignInSheet: $isShowingSignInSheet)
                case .checkPassword:
                    CheckPasswordView(screen: $screen)
                        .signInToolbarStyle(screen: $screen, isShowingSignInSheet: $isShowingSignInSheet)
                case .inputUserInfo:
                    InputUserInfoView(screen: $screen)
                        .signInToolbarStyle(screen: $screen, isShowingSignInSheet: $isShowingSignInSheet)
                case .cellPhoneCertification:
                    CellPhoneCertificationView(screen: $screen)
                        .signInToolbarStyle(screen: $screen, isShowingSignInSheet: $isShowingSignInSheet)
                case .loginCompleted:
                    LoginCompletedView(isShowingSignInSheet: $isShowingSignInSheet)
                        .signInToolbarStyle(screen: $screen, isShowingSignInSheet: $isShowingSignInSheet)
                }
            }
            Spacer()
        }
    }
    
    private var SignUpButton: some View {
        Button {
            isShowingSignInSheet.toggle()
        } label: {
            Text("가입하기")
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .padding(.horizontal)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .cornerRadius(20)
        }
    }
    
    private var SignInButton: some View {
        Button {
            isShowingSignInSheet.toggle()
        } label: {
            Text("로그인")
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 2)
        }
    }
    
    private var imageBackground: some View {
        ZStack {
            AsyncImage(url: URL(string: images[imageIndex])) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .transition(.opacity)
            .id(images[imageIndex])
            
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                withAnimation(.default) {
                    imageIndex += 1
                }
            })
        }
        .onChange(of: imageIndex) { _ in
            if imageIndex >= images.count-1 {
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    withAnimation(.default) {
                        imageIndex = 0
                    }
                })
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    withAnimation(.default) {
                        imageIndex += 1
                    }
                })
            }
        }
    }
}

enum LoginRegisterScreen: CaseIterable {
    case loginRegister
    case termsOfService
    case checkPassword
    case inputUserInfo
    case cellPhoneCertification
    case loginCompleted
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
