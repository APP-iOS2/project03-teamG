//
//  CheckPasswordView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI

struct CheckPasswordView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Binding var screen: LoginRegisterScreen
    
    @State private var password: String = ""
    @State private var cautionPassword: String = ""
    @State private var isPassworldValid: Bool = true
    @State private var isMatchedPassword: Bool = true
    @State private var showPassword: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("비밀번호를 입력하세요.")
                    .font(.mediumBold24)
                    .padding(.bottom, 12)
                
                HStack {
                    Text(authViewModel.userInfo.email)
                        .accentColor(.black)
                    
                    Button {
                        screen = .loginRegister
                    } label: {
                        Text("편집")
                            .underline()
                            .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 20)
                
                if !isMatchedPassword {
                    HStack {
                        Image(systemName: "exclamationmark.circle")
                            .foregroundColor(.red)
                        Text("비밀번호가 일치하지 않습니다.")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.gray.opacity(0.3))
                }
                
                HStack {
                    if showPassword {
                        TextField("비밀번호", text: $password)
                            .onChange(of: password) { newValue in
                                isCheckPassword()
                                password = newValue.trimmingCharacters(in: .whitespaces)
                            }
                    } else {
                        SecureField("비밀번호", text: $password)
                            .onChange(of: password) { newValue in
                                isCheckPassword()
                                password = newValue.trimmingCharacters(in: .whitespaces)
                            }
                    }
                    
                    Button {
                        self.showPassword.toggle()
                    } label: {
                        if showPassword == true {
                            Image(systemName: "eye")
                                .foregroundColor(.black)
                        } else if showPassword == false {
                            Image(systemName: "eye.slash")
                                .foregroundColor(.black)
                        }
                    }
                    
                }
                .modifier(SignInTextFieldStyle(isTextFieldValid: $isPassworldValid))
                .padding(.top, 12)
                
                Text(cautionPassword)
                    .foregroundColor(.red)
                    .padding(.bottom, 12)
                
                Button {
                    screen = .findPassword
                } label: {
                    Text("비밀번호 찾기")
                        .underline()
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 35)
                
                ButtonView(buttonText: "로그인", foreground: .white, background: .black) {
                    authViewModel.signIn(authViewModel.userInfo.email, password) { success in
                        if success {
                            screen = .loginCompleted
                        } else {
                            isMatchedPassword = false
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func isCheckPassword() {
        if password.count < 1 {
            cautionPassword = "필수"
            isPassworldValid = false
        } else {
            cautionPassword = ""
            isPassworldValid = true
        }
    }
}

struct CheckPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckPasswordView(screen: .constant(.checkPassword))
        }
    }
}
