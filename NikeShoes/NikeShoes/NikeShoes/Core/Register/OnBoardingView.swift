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
        NavigationStack {
            VStack {
                RegisterContainerView(isContinueButtonClicked: false, isPreviousButtonClicked: false, index: 0)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct RegisterContainerView: View {
    @State private var isPressedRegisterButton: Bool = false
    @State private var isPressedLoginButton: Bool = false
    
    @State private var isShowingSignInSheet: Bool = false
    
    @State private var isContinueButtonClicked: Bool = false
    @State private var isPreviousButtonClicked: Bool = false
    @State private var index: Int = 0
    
    init(isContinueButtonClicked: Bool, isPreviousButtonClicked: Bool, index: Int) {
        self.isContinueButtonClicked = isContinueButtonClicked
        self.isPreviousButtonClicked = isPreviousButtonClicked
        self.index = index
    }
    
    var body: some View {
        ZStack {
            if index < 4 {
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Spacer()
                    
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
            } else {
                OBView()
            }
        }
        .sheet(isPresented: $isShowingSignInSheet) {
            SheetConatinerView
        }
    }
    
    var SheetConatinerView: some View {
        NavigationStack {
            switch index {
            case 0:
                LoginRegisterView(index: $index)
                    .modifier(SignInToolbarStyle(isPressedRegisterButton: $isPressedRegisterButton, isPressedLoginButton: $isPressedLoginButton, isShowingSignInSheet: $isShowingSignInSheet, index: $index))
            case 1:
                if isPressedRegisterButton {
                    TermsOfServiceView(index: $index)
                        .modifier(SignInToolbarStyle(isPressedRegisterButton: $isPressedRegisterButton, isPressedLoginButton: $isPressedLoginButton, isShowingSignInSheet: $isShowingSignInSheet, index: $index))
                } else if isPressedLoginButton {
                    CheckPasswordView(index: $index)
                        .modifier(SignInToolbarStyle(isPressedRegisterButton: $isPressedRegisterButton, isPressedLoginButton: $isPressedLoginButton, isShowingSignInSheet: $isShowingSignInSheet, index: $index))
                }
            case 2:
                InputUserInfoView(index: $index)
                    .modifier(SignInToolbarStyle(isPressedRegisterButton: $isPressedRegisterButton, isPressedLoginButton: $isPressedLoginButton, isShowingSignInSheet: $isShowingSignInSheet, index: $index))
            case 3:
                CellPhoneCertificationView(index: $index)
                    .modifier(SignInToolbarStyle(isPressedRegisterButton: $isPressedRegisterButton, isPressedLoginButton: $isPressedLoginButton, isShowingSignInSheet: $isShowingSignInSheet, index: $index))
            case 4:
                LoginCompletedView(index: $index, isShowingSignInSheet: $isShowingSignInSheet)
                    .modifier(SignInToolbarStyle(isPressedRegisterButton: $isPressedRegisterButton, isPressedLoginButton: $isPressedLoginButton, isShowingSignInSheet: $isShowingSignInSheet, index: $index))
            default:
                EmptyView()
            }
        }
    }
    
    var SignUpButton: some View {
        Button {
            isPressedRegisterButton.toggle()
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
    
    var SignInButton: some View {
        Button {
            isPressedLoginButton.toggle()
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
}

struct SignInToolbarStyle: ViewModifier {
    @Binding var isPressedRegisterButton: Bool
    @Binding var isPressedLoginButton: Bool
    @Binding var isShowingSignInSheet: Bool
    @Binding var index: Int
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isPressedRegisterButton = false
                        isPressedLoginButton = false
                        isShowingSignInSheet = false
                        index = 0
                    } label: {
                        Text("취소")
                    }

                }
            }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
