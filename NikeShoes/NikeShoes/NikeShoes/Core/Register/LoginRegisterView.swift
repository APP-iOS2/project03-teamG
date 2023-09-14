//
//  SignUpView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI
import NikeShoesCore

struct LoginRegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Binding var screen: LoginRegisterScreen
    
    @State private var email: String = ""
    @State private var cautionEmail: String = ""
    @State private var isEmailValid: Bool = true
    
    @State private var selectedCountry: String = "대한민국"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("가입 또는 로그인을 위해 이메일을 입력하세요.")
                    .font(.mediumBold24)
                    .padding(.bottom, 12)
                
                HStack(alignment: .top) {
                    Text(selectedCountry)
                    
                    Menu("변경") {
                        Picker("국가 변경", selection: $selectedCountry) {
                            ForEach(countries, id: \.self) { country in
                                Text(country)
                            }
                        }
                    }
                    .foregroundColor(.gray)
                    .underline()
                }
                .padding(.bottom, 40)
                
                TextField("이메일", text: $email)
                    .keyboardType(.emailAddress)
                    .signInTextFieldStyle(isTextFieldValid: $isEmailValid)
                    .onChange(of: email) { newValue in
                        isCheckEmail()
                        email = newValue.trimmingCharacters(in: .whitespaces)
                    }
                
                Text(cautionEmail)
                    .foregroundColor(.red)
                
                Text("계속 진행하면 나이키의 개인정보 처리 방침 및 이용약관에 동의하게 됩니다.")
                    .foregroundColor(.gray)
                    .padding(.vertical, 40)
                
                ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                    if !isValidEmail(email) {
                        cautionEmail = "필수"
                        isEmailValid = false
                    } else {
                        authViewModel.isAlreadySignUp(email) { (isInUse, error) in
                            if let error = error {
                                print("\(error.localizedDescription)")
                            } else {
                                if isInUse {
                                    screen = .checkPassword
                                } else {
                                    screen = .termsOfService
                                }
                                authViewModel.userInfo.email = email
                                authViewModel.userInfoCountry = selectedCountry
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func isCheckEmail() {
        if isValidEmail(email) {
            cautionEmail = ""
            isEmailValid = true
        } else if !isValidEmail(email) && email.count > 0 {
            cautionEmail = "올바르지 않은 이메일 주소입니다"
            isEmailValid = false
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView(screen: .constant(.loginRegister))
    }
}
