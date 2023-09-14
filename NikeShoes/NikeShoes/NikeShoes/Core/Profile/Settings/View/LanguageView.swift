//
//  LanguageView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/06.
//

import SwiftUI

struct LanguageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showModal: Bool = false
    @State var selectedLang: String = "한국어"
    
    let title: String
    let logoURL: URL = URL(string: "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fo2k2o%2FbtqwR37aRMc%2FimACexBUQZJms7mQRkQck1%2Fimg.jpg")!
    let Languages = ["한국어", "영어", "스페인어", "프랑스어", "아랍어"]
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                AsyncImage(url: logoURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 144, height: 72)
                    case .failure:
                        Text("Failed to load image.")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text("언어 선택")
                    .font(.title)
                Text("Nike 앱에서 지원되는 언어를 업데이트하세요")
                    .font(.subheadline)
                
                Button {
                    showModal.toggle()
                } label: {
                    HStack {
                        Text(selectedLang)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 0.5))
                .frame(width: 250)
                .padding(.top)
                
                Spacer()
                
                CustomButton(background: .black, foregroundColor: .white, title: "확인", action: {
                    presentationMode.wrappedValue.dismiss()
                })
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
            VStack {
                Picker("언어선택", selection: $selectedLang) {
                    ForEach(Languages, id: \.self) { lang in
                        Text(lang).tag(lang)
                    }
                }
                .pickerStyle(WheelPickerStyle())

            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 20)
            .offset(y: showModal ? UIScreen.main.bounds.height / 3.7 : UIScreen.main.bounds.height)
            .animation(.easeInOut(duration: 1.0), value: showModal)
        }
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LanguageView(title: "언어 선택")
        }
    }
}
