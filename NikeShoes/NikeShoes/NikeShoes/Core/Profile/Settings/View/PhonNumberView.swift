//
//  PhonNumberView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct PhonNumberView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    @State private var nationCode: String = ""
    @State private var phoneNumber: String = ""
    
    @State private var isChecked: Bool = false
    @State private var canSendCode: Bool = false
    
    var body: some View {
        VStack(alignment:.leading){
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("휴대폰 번호를 인증하세요.")
                    .font(.title)
                    .foregroundColor(.black)
                
                Text("+82 10 1234 1234")
                    .foregroundColor(.gray)
                    .padding(.top)
                
                Text("일회성 인증번호 발송을 위해 휴대폰 번호를 입력해 주세요.")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .padding(.top, 7)
            }
            .padding()
            
            HStack {
                TextField("New Email", text: $nationCode)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                TextField("ConfirmEmail", text: $phoneNumber)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
            }
            .padding()
            .onChange(of: [nationCode, phoneNumber]) { _ in
                validator(nationCode: nationCode, phoneNumber: phoneNumber)
            }
            
            // 이용약관 동의
            Button {
                isChecked.toggle()
            } label: {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .fontWeight(Font.Weight.thin)
                        .foregroundColor(.black)
                    
                    Text("문자메시지 1회 수신을 위한 개인정보처리방침 및 이용약관 동의")
                        .font(Font.caption)
                        .foregroundColor(.black)
                }
                .padding(20)
            }
            .onChange(of: isChecked) { isChecked in
                validator(nationCode: nationCode, phoneNumber: phoneNumber)
            }
            
            CustomButton(
                background: canSendCode ? Color.black : Color.gray.opacity(0.3),
                foregroundColor: canSendCode ? Color.white : Color.black.opacity(0.5),
                title: "코드전송"
            ) {
                // mark: email update logic ----------------
                self.presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .disabled(canSendCode)
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
    
    func validator(nationCode: String, phoneNumber: String) {
        if !nationCode.isEmpty && !phoneNumber.isEmpty {
            print(nationCode, phoneNumber)
            canSendCode = isChecked
            return
        }
        canSendCode = false
        return
    }
    
}

struct PhonNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhonNumberView(title: "PhonNumber")
    }
}
