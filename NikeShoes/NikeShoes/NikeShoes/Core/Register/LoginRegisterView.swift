//
//  SignUpView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct LoginRegisterView: View {
    @Binding var index: Int
    
    @State private var email: String = ""
    @State private var cautionEmail: String = ""
    @State private var isEmailValid: Bool = true
    
    @State private var selectedCountry: String = "대한민국"
    
    let countries: [String] = [
        "가나", "가봉", "가이아나", "대한민국", "기타등등"
    ]
    
    var body: some View {
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
                .modifier(SignInTextFieldStyle(isTextFieldValid: $isEmailValid))
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
                    index += 1
                }
            }
        }
        .padding(.horizontal)
    }
    
    func isCheckEmail() {
        if isValidEmail(email) {
            cautionEmail = ""
            isEmailValid = true
        } else if !isValidEmail(email) && email.count > 0 {
            cautionEmail = "잘못된 이메일 주소입니다"
            isEmailValid = false
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView(index: .constant(0))
    }
}
