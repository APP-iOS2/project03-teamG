//
//  CellPhoneCertificationView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct CellPhoneCertificationView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Binding var screen: LoginRegisterScreen
    
    @State private var cellPhoneNumber: String = ""
    @State private var certificationCode: String = ""
    @State private var isAgreeReceiveMarketing: Bool = false
    
    @State private var isCellPhoneNumberValid: Bool = true
    @State private var isCertificationCodeValid: Bool = true
    
    @State private var cautionCellPhoneNumber: String = ""
    @State private var cautionCertificationCode: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("휴대폰 번호를 인증하세요")
                    .font(.mediumBold24)
                    .padding(.bottom, 12)
                
                Text("안전한 구매와 추가 보안 조치를 위해, 일회성 인증코드를 전송합니다.")
                    .padding(.bottom, 12)
                
                Text(authViewModel.userInfo.email)
                    .accentColor(.black)
                    .padding(.bottom, 20)
                
                CellPhoneNumberTextField
                
                CertificationCodeTextField
                
                Button {
                    isAgreeReceiveMarketing.toggle()
                } label: {
                    HStack(alignment: .top) {
                        Image(systemName: isAgreeReceiveMarketing ? "checkmark.square.fill" : "square")
                        Text("(선택사항) 나이키의 생일 리워드, 멤버 전용 혜택, 특별 프로모션 소식 등의 메시지 수신에 동의합니다. 마케팅 커뮤니케이션 목적으로 나이키가 보내는 SMS 마케팅 메시지 수신 및 나이키의 개인 정보 수집 및 이용에 동의합니다.")
                            .multilineTextAlignment(.leading)
                    }
                    .foregroundColor(.primary)
                }
                .padding(.bottom, 35)
                
                ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                    if cellPhoneNumber.isEmpty && certificationCode.isEmpty {
                        isCheckCellPhoneNumber()
                        isCheckCertificationCode()
                    } else {
                        authViewModel.userInfo.phoneNumber = cellPhoneNumber
                        authViewModel.register()
                        screen = .loginCompleted
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    var CellPhoneNumberTextField: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("+82")
                
                TextField("휴대폰 번호", text: $cellPhoneNumber)
                    .onChange(of: cellPhoneNumber) { newValue in
                        isCheckCellPhoneNumber()
                        cellPhoneNumber = newValue.trimmingCharacters(in: .whitespaces)
                    }
                
                Button {
                    // action ...
                } label: {
                    Image(systemName: "arrow.forward")
                        .foregroundColor(.primary)
                }
            }
            .signInTextFieldStyle(isTextFieldValid: $isCellPhoneNumberValid)
            
            Text(cautionCellPhoneNumber)
                .foregroundColor(.red)
        }
    }
    
    var CertificationCodeTextField: some View {
        VStack(alignment: .leading) {
            TextField("코드", text: $certificationCode)
                .signInTextFieldStyle(isTextFieldValid: $isCertificationCodeValid)
                .onChange(of: certificationCode) { newValue in
                    isCheckCertificationCode()
                    certificationCode = newValue.trimmingCharacters(in: .whitespaces)
                }
            
            Text(cautionCertificationCode)
                .foregroundColor(.red)
        }
        .padding(.bottom, 20)
    }
    
    func isCheckCellPhoneNumber() {
        if isValidCheckCellPhoneNumber(cellPhoneNumber) {
            cautionCellPhoneNumber = ""
            isCellPhoneNumberValid = true
        } else {
            cautionCellPhoneNumber = "잘못된 휴대폰 번호입니다"
            isCellPhoneNumberValid = false
        }
    }
    
    func isValidCheckCellPhoneNumber(_ cellPhoneNumber: String) -> Bool {
        let regex = "^01([0|1|6|7|8|9]?) ?([0-9]{4}) ?([0-9]{4})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: cellPhoneNumber)
    }
    
    /// 임의 코드 "12345678"
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
}

struct CellPhoneCertificationView_Previews: PreviewProvider {
    static var previews: some View {
        CellPhoneCertificationView(screen: .constant(.cellPhoneCertification))
            .environmentObject(AuthViewModel(service: DefaultFireStoreService()))
    }
}
