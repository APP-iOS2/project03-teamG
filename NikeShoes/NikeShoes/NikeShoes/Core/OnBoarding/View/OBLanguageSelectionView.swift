//
//  OBWelcomeView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

enum Language: String, CaseIterable, Identifiable {
    case kr = "한국어"
    case en = "영어"
    case sp = "스페인어"
    case pr = "프랑스어"
    case ar = "아랍어"

    var value: String {
        self.rawValue
    }
    var id: Self {
        self
    }
}

struct OBLanguageSelectionView: View {
    
    @EnvironmentObject var obViewModel: OBViewModel
    @Binding var index: Int
    var description: String = "언어 선택"
    var description2: String = "Nike 앱에서 지원되는 언어로 업데이트하세요."
   
    @State var language: String = "한국어"
    @State private var showingSheet = false

    var date: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {

            Image("nike_ob")
                .padding(.top, 200)
            
            HStack {
                Text("\(description)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                Spacer()
            }

            HStack {
                Text("\(description2)")
                    .bold()
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 10)
                Spacer()
            }
            
            Text("\(language)") .bold()
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
            
            LanguageSelectionButton(showingSheet: $showingSheet, language: $language)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(.top, 50)
            
            Spacer()
            
            HStack {
                Spacer()
                TempButton(title: OBScreen.languageSelection.title) {
                    Task {
                        index += 1
                    }
                }.padding(20)
                Spacer()
            }
            
        }.sheet(isPresented: $showingSheet) {
            Picker("language", selection: $language) {
                ForEach(Language.allCases) { Text($0.value.capitalized).tag($0.rawValue) }
            }
            .pickerStyle(.wheel)
                .presentationDetents([.fraction(0.3)])
        }
    }
}

struct LanguageSelectionButton: View {
    
    @Binding var showingSheet: Bool
    @Binding var language: String
    let heights = stride(from: 0.5, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    showingSheet.toggle()
                    
                }, label: {
                    Text("\(language)")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(20)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.white)
                        .padding(20)
                })
            }
        }
    }
}

struct OBLanguageSelectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            Color.black
            OBLanguageSelectionView(index: .constant(5))
        }.ignoresSafeArea()
    }
}
