//
//  CheckPasswordView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI

struct CheckPasswordView: View {
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호를 입력하세요.")
                .font(.mediumBold24)
                .padding(.bottom, 12)
            
            HStack {
                Text("test@nike.com")
                    .accentColor(.black)
                
                Button {
                    // action ...
                } label: {
                    Text("변경")
                        .underline()
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom, 20)
            
            TextField("비밀번호", text: $password)
                .modifier(SignUpTextFieldStyle())
                .padding(.bottom, 20)
            
            Button {
                // action ...
            } label: {
                Text("비밀번호 찾기")
                    .underline()
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 35)
        }
        .padding(.horizontal)
    }
}

struct CheckPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CheckPasswordView()
        }
    }
}
