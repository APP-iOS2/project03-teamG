//
//  SignUpView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct LoginRegisterView: View {
    @State private var email: String = ""
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
                .modifier(SignUpTextFieldStyle())
            
            Text("계속 진행하면 나이키의 개인정보 처리 방침 및 이용약관에 동의하게 됩니다.")
                .foregroundColor(.gray)
                .padding(.vertical, 40)
        }
        .padding(.horizontal)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterView()
    }
}
