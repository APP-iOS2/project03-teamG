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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("이제 나이키 멤버가 되어볼까요?")
                    .font(.system(size: 24).weight(.medium))
                    .padding(.bottom, 12)
                
                HStack {
                    TextField("이름", text: $firstName)
                        .modifier(SignUpTextFieldStyle())
                    TextField("성", text: $lastName)
                        .modifier(SignUpTextFieldStyle())
                }
                
                Group {
                    TextField("비밀번호", text: $password)
                        .modifier(SignUpTextFieldStyle())
                    
                    HStack {
                        Image(systemName: "xmark")
                        Text("최소 8자")
                    }
                    .font(.footnote)
                    .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "xmark")
                        Text("알파벳 대문자 및 소문자 조합, 최소 1개 이상의 숫자")
                    }
                    .font(.footnote)
                    .foregroundColor(.gray)
                }
                
                DatePicker("생년월일", selection: $admissionDatePicker, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .modifier(SignUpTextFieldStyle())
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
