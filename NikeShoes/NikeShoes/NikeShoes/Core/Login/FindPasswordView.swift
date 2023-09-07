//
//  FindPasswordView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI

struct FindPasswordView: View {
    @State private var certificationCode: String = ""
    @State private var newPassword: String = ""
    
    @State private var isCertificationCodeValid: Bool = true
    @State private var isNewPasswordValid: Bool = true
    
    @State private var isPasswordValid: Bool = true
    @State private var isPasswordCountEight: Bool = true
    @State private var isPasswordCombination: Bool = true
    @State private var isRightPasswordCountEightSymbol: String = "xmark"
    @State private var isRightPasswordCountEightColor: Color = .gray
    @State private var isRightPasswordCombinationSymbol: String = "xmark"
    @State private var isRightPasswordCombinationColor: Color = .gray
    @State private var showPassword: Bool = false
    
    @State private var cautionCertificationCode: String = ""
    @State private var cautionNewPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("전화번호를 인증하고 새 비밀번호를 입력하세요.")
                .font(.mediumBold24)
                .padding(.bottom, 12)
            
            Text("고객님의 전화번호와 이메일 주소로 안전한 일회용 인증 코드를 보내드렸습니다.")
                .foregroundColor(.gray)
                .padding(.bottom, 12)
            
            VStack(alignment: .leading) {
                Text("*******1234")
                
                HStack {
                    Text("test@nike.com")
                        .accentColor(.black)
                    
                    Button {
                        // action ...
                    } label: {
                        Text("편집")
                            .underline()
                            .foregroundColor(.gray)
                    }
                }
            }
            
            CertificationTextField
                .padding(.bottom, 35)
            
            ButtonView(buttonText: "저장", foreground: .white, background: .black) {

            }
            ButtonView(buttonText: "취소", foreground: .black, background: .white) {

            }
        }
        .padding(.horizontal)
    }
    
    var CertificationTextField: some View {
        VStack {
            VStack(alignment: .trailing) {
                VStack(alignment: .leading) {
                    HStack {
                        TextField("코드", text: $certificationCode)
                            .onChange(of: certificationCode) { newValue in
                                isCheckCertificationCode()
                                certificationCode = newValue.trimmingCharacters(in: .whitespaces)
                            }
                        
                        Button {
                            // action ...
                        } label: {
                            Image(systemName: "gobackward")
                                .foregroundColor(.gray)
                        }
                    }
                    .modifier(SignInTextFieldStyle(isTextFieldValid: $isCertificationCodeValid))
                    
                    Text(cautionCertificationCode)
                        .foregroundColor(.red)
                }
                
                Text("00초 후 코드 재전송")
                    .font(.regular12)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    if showPassword {
                        TextField("비밀번호", text: $newPassword)
                    } else {
                        SecureField("비밀번호", text: $newPassword)
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
                .modifier(SignInTextFieldStyle(isTextFieldValid: $isNewPasswordValid))
                
                Text(cautionNewPassword)
                    .foregroundColor(.red)
                
                HStack {
                    Image(systemName: "xmark")
                    Text("최소 8자")
                }
                .font(.regular12)
                .foregroundColor(isRightPasswordCountEightColor)
                .onChange(of: newPassword) { newValue in
                    isEmptyNewPassword()
                    isCheckNewPasswordCount()
                    isCheckNewPasswordCombination()
                    newPassword = newValue.trimmingCharacters(in: .whitespaces)
                }
                
                HStack {
                    Image(systemName: isRightPasswordCombinationSymbol)
                    Text("알파벳 대문자 및 소문자 조합, 최소 1개 이상의 숫자")
                }
                .font(.regular12)
                .foregroundColor(isRightPasswordCombinationColor)
            }
        }
    }
    
    // MARK: - certification function
    func isCheckCertificationCode() {
        if certificationCode == "12345678" {
            cautionCertificationCode = ""
            isCertificationCodeValid = true
        } else if certificationCode.isEmpty {
            cautionCertificationCode = "필수"
            isCertificationCodeValid = false
        } else {
            cautionCertificationCode = "잘못된 인증입니다"
            isCertificationCodeValid = false
        }
    }
    // MARK: - password function
    func isEmptyNewPassword() {
        if newPassword.isEmpty {
            isPasswordValid = false
            cautionNewPassword = "필수"
        } else {
            isPasswordValid = true
            cautionNewPassword = ""
        }
    }
    
    func isCheckNewPasswordCount() {
        if newPassword.count < 8 {
            isRightPasswordCountEightSymbol = "xmark"
            isRightPasswordCountEightColor = .red
            isPasswordCountEight = false
        } else {
            isRightPasswordCountEightSymbol = "checkmark"
            isRightPasswordCountEightColor = .green
            isPasswordCountEight = true
        }
    }
    
    func isCheckNewPasswordCombination() {
        if isValidNewPassword(newPassword) {
            isRightPasswordCombinationSymbol = "checkmark"
            isRightPasswordCombinationColor = .green
            isPasswordCombination = true
        } else {
            isRightPasswordCombinationSymbol = "xmark"
            isRightPasswordCombinationColor = .red
            isPasswordCombination = false
        }
    }
    
    func isValidNewPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}

struct FindPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        FindPasswordView()
    }
}
