//
//  PhonNumberView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct PhonNumberView: View {
    @Environment(\.presentationMode) var presentationMode
    let userInfoEdit = UserInfoEditViewModel()
    let title: String

    @State private var nationCode: String = ""
    @State private var phoneNumber: String = ""
    @State private var isChecked: Bool = false
    @State private var canSendCode: Bool = false
    @State private var showModal: Bool = false
    @State private var selectedNation: Nation = .Korea

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Divider()

                VStack(alignment: .leading) {
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
                        Text(selectedNation.details.phoneNumberPrefix)
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
                    ZStack {
                        TextField("Phon Number", text: $phoneNumber)
                            .padding(15)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedNation != Nation.Korea ? Color.red : Color.black, lineWidth: 0.5))
                        Text("휴대폰 번호")
                            .font(.caption2)
                            .foregroundColor(selectedNation != Nation.Korea ? Color.red : .gray)
                            .background(.white)
                            .offset(x: -97, y: -25)
                        if selectedNation != Nation.Korea {
                            Text("유효하지 않은 형식")
                                .font(.caption2)
                                .foregroundColor(.red)
                                .background(.white)
                                .offset(x: -85, y: 40)
                        }
                    }
                    
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
                .onChange(of: isChecked) { _ in
                    validator(nationCode: nationCode, phoneNumber: phoneNumber)
                }

                CustomButton(
                    background: canSendCode ? Color.black : Color.gray.opacity(0.3),
                    foregroundColor: canSendCode ? Color.white : Color.black.opacity(0.5),
                    title: "코드전송"
                ) {
                    Task {
                        await userInfoEdit.updatePhoneNumber(newPhoneNumber: phoneNumber)
                        self.presentationMode.wrappedValue.dismiss()
                    }
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
            VStack(alignment: .leading) {
                Text("국가 / 지역 코드")
                    .font(.headline)
                    .padding()
                List {
                    ForEach(Nation.allCases, id: \.self) { code in
                        HStack {
                            Text("\(code.details.code) - \(code.details.name) \(code.details.phoneNumberPrefix)")
                                .font(.medium16)
                                .padding(.vertical)

                            Spacer()
                            
                            if code == selectedNation {
                                Image(systemName: "checkmark")
                            }
                        }
                        .onTapGesture {
                            selectedNation = code
                            showModal = false
                        }
                    }
                }
                .listStyle(.plain)
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
        NavigationStack {
            PhonNumberView(title: "PhonNumber")
        }
    }
}

enum Nation: CaseIterable {
    case Korea
    case USA
    case China
    case Japan
    case Russia
    case India
    case Brazil
    case France
    case Germany
    case UK
    case Italy
    case Canada
    case Australia
    case SaudiArabia
    case Mexico
    case SouthAfrica
    case Turkey
    case Indonesia
    case Spain
    case Argentina
    
    var details: (code: String, name: String, phoneNumberPrefix: String) {
        switch self {
        case .Korea: return ("KR", "대한민국", "+82")
        case .USA: return ("US", "미국", "+1")
        case .China: return ("CN", "중국", "+86")
        case .Japan: return ("JP", "일본", "+81")
        case .Russia: return ("RU", "러시아", "+7")
        case .India: return ("IN", "인도", "+91")
        case .Brazil: return ("BR", "브라질", "+55")
        case .France: return ("FR", "프랑스", "+33")
        case .Germany: return ("DE", "독일", "+49")
        case .UK: return ("GB", "영국", "+44")
        case .Italy: return ("IT", "이탈리아", "+39")
        case .Canada: return ("CA", "캐나다", "+1")
        case .Australia: return ("AU", "호주", "+61")
        case .SaudiArabia: return ("SA", "사우디 아라비아", "+966")
        case .Mexico: return ("MX", "멕시코", "+52")
        case .SouthAfrica: return ("ZA", "남아프리카 공화국", "+27")
        case .Turkey: return ("TR", "터키", "+90")
        case .Indonesia: return ("ID", "인도네시아", "+62")
        case .Spain: return ("ES", "스페인", "+34")
        case .Argentina: return ("AR", "아르헨티나", "+54")
        }
    }
}
