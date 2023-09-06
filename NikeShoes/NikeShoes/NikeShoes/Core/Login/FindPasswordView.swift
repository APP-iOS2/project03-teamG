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
            
        }
        .padding(.horizontal)
    }
    
    var CertificationTextField: some View {
        VStack {
            VStack(alignment: .trailing) {
                TextField("코드", text: $certificationCode)
                    .modifier(SignUpTextFieldStyle())
                
                Text("00초 후 코드 재전송")
                    .font(.regular12)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                TextField("코드", text: $newPassword)
                    .modifier(SignUpTextFieldStyle())
                
                HStack {
                    Image(systemName: "xmark")
                    Text("최소 8자")
                }
                .font(.regular12)
                .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: "xmark")
                    Text("알파벳 대문자 및 소문자 조합, 최소 1개 이상의 숫자")
                }
                .font(.regular12)
                .foregroundColor(.gray)
            }
        }
    }
}

struct FindPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        FindPasswordView()
    }
}
