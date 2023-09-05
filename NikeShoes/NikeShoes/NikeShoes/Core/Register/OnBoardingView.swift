//
//  OnBoardingView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isShowingSignUpSheet: Bool = false
    @State private var isShowingSignInSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text("나이키\n멤버에게\n최고의 제품,\n스포트에 대한 영감과 스토리를\n소개합니다.")
                    .font(.system(size: 24).weight(.medium))
                    .foregroundColor(.white)
                    .lineSpacing(6)
                    .padding(.bottom, 30)
                
                HStack {
                    SignUpButton
                    SignInButton
                }
            }
            .frame(maxWidth: .infinity)
            .padding([.trailing, .bottom], 60)
        }
        .sheet(isPresented: $isShowingSignUpSheet) {
            NavigationStack {
                SignUpView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isShowingSignUpSheet = false
                            } label: {
                                Text("취소")
                            }

                        }
                    }
            }
        }
    }
    
    var SignUpButton: some View {
        Button {
            isShowingSignUpSheet.toggle()
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

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
