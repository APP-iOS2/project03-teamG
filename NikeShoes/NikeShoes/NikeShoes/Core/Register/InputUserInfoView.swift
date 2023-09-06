//
//  InputUserInfoView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct InputUserInfoView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var admissionDatePicker = Date()
    @State private var isAgreePrivacyPolicyandTerms: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("이제 나이키 멤버가 되어볼까요?")
                    .font(.mediumBold24)
                    .padding(.bottom, 12)
                
                HStack(spacing: 12) {
                    TextField("이름", text: $firstName)
                        .modifier(SignUpTextFieldStyle())
                    TextField("성", text: $lastName)
                        .modifier(SignUpTextFieldStyle())
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    TextField("비밀번호", text: $password)
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
                .padding(.bottom, 20)
                
                DatePicker("생년월일", selection: $admissionDatePicker, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .modifier(SignUpTextFieldStyle())
                    .padding(.bottom, 35)
                
                HStack(alignment: .top) {
                    Image(systemName: isAgreePrivacyPolicyandTerms ? "checkmark.square.fill" : "square")
                        .onTapGesture {
                            isAgreePrivacyPolicyandTerms.toggle()
                        }
                    Text ("나이키의 개인정보 처리방침 및 이용약관에 동의합니다.")
                }
                .padding(.bottom, 45)
            }
        }
        .padding(.horizontal)
    }
}

struct InputUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        InputUserInfoView()
    }
}
