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
    @State private var showModal: Bool = false

    var body: some View {
        ZStack {
            VStack(alignment:.leading) {
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
                    // 국가 지역 코드 표시 & 모달 열기
                    HStack {
                        Text("국가 / 지역 ")
                        Image(systemName: "chevron.down")
                    }
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                    .onTapGesture {
                        withAnimation {
                            showModal.toggle()
                        }
                    }

                    // 휴대전화 번호 입력
                    TextField("Phon Number", text: $phoneNumber)
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
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .disabled(canSendCode)

                Spacer()
            }
            
            if showModal {
                Color.gray
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showModal = false
                        }
                    }
            }

            // 슬라이드업 모달
            VStack {
                Text("국가/지역")
                ScrollView{
                    ForEach(codes, id: \.self) { code in
                        Text(code)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(y: showModal ? UIScreen.main.bounds.height / 5 : UIScreen.main.bounds.height)
            .animation(.easeInOut(duration: 1.0), value: showModal)
        }
        .modifier(NavigationNikeSetting(title: title))
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
        NavigationStack{
            PhonNumberView(title: "PhonNumber")
        }
    }
}


let codes = [
    "대한민국 - KR, +82",
    "미국 - US, +1",
    "중국 - CN, +86",
    "일본 - JP, +81",
    "러시아 - RU, +7",
    "인도 - IN, +91",
    "브라질 - BR, +55",
    "프랑스 - FR, +33",
    "독일 - DE, +49",
    "영국 - GB, +44",
    "이탈리아 - IT, +39",
    "캐나다 - CA, +1",
    "호주 - AU, +61",
    "사우디 아라비아 - SA, +966",
    "멕시코 - MX, +52",
    "남아프리카 공화국 - ZA, +27",
    "터키 - TR, +90",
    "인도네시아 - ID, +62",
    "스페인 - ES, +34",
    "아르헨티나 - AR, +54"
]
