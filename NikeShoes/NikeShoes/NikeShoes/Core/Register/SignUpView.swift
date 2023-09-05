//
//  SignUpView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var selectedCountry: String = "대한민국"
    
    let countries: [String] = [
        "가나", "가봉", "가이아나", "대한민국", "기타등등"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("가입 또는 로그인을 위해 이메일을 입력하세요.")
                .font(.system(size: 24).weight(.medium))
                .padding(.bottom, 12)
            
            HStack {
                Text(selectedCountry)
                    .padding(.bottom, 40)
                
                // TODO: picker....
                Picker(selection: $selectedCountry) {
                    ForEach(countries, id: \.self) { country in
                        Text(country)
                    }
                } label: {
                    Text("변경")
                }
            }
            
            TextField("이메일", text: $email)
                .modifier(SignUpTextFieldStyle())
            
            Text("계속 진행하면 나이키의 개인정보 처리 방침 및 이용약관에 동의하게 됩니다.")
                .foregroundColor(.gray)
                .padding(.vertical, 40)
            
            ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                // action
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
