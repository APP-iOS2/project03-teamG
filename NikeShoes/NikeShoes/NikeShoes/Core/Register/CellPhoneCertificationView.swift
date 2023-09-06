//
//  CellPhoneCertificationView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI

struct CellPhoneCertificationView: View {
    @State private var cellPhoneNumber: String = ""
    @State private var certificationCode: String = ""
    @State private var isAgreeReceiveMarketing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("휴대폰 번호를 인증하세요")
                .font(.mediumBold24)
                .padding(.bottom, 12)
            
            Text("안전한 구매와 추가 보안 조치를 위해, 일회성 인증코드를 전송합니다.")
                .padding(.bottom, 12)
            
            Text("test@nike.com")
                .accentColor(.black)
                .padding(.bottom, 20)
            
            TextField("휴대폰 번호", text: $cellPhoneNumber)
                .modifier(SignUpTextFieldStyle())
                .padding(.bottom, 20)
            
            TextField("코드", text: $certificationCode)
                .modifier(SignUpTextFieldStyle())
                .padding(.bottom, 35)
            
            HStack(alignment: .top) {
                Image(systemName: isAgreeReceiveMarketing ? "checkmark.square.fill" : "square")
                    .onTapGesture {
                        isAgreeReceiveMarketing.toggle()
                    }
                Text ("(선택사항) 나이키의 생일 리워드, 멤버 전용 혜택, 특별 프로모션 소식 등의 메시지 수신에 동의합니다. 마케팅 커뮤니케이션 목적으로 나이키가 보내는 SMS 마케팅 메시지 수신 및 나이키의 개인 정보 수집 및 이용에 동의합니다.")
            }
            .padding(.bottom, 35)
        }
        .padding(.horizontal)
    }
}

struct CellPhoneCertificationView_Previews: PreviewProvider {
    static var previews: some View {
        CellPhoneCertificationView()
    }
}
