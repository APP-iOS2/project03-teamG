//
//  OBWelcomeView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI




enum Language: String,CaseIterable, Identifiable {
    case kr
    case en
    
    var id: Self {
        self
    }
}


struct OBLanguageSelectionView: View {
    
    var description: String = "언어 선택"
    var description2: String = "Nike 앱에서 지원되는 언어로 업데이트하세요."
   
    @State var myvar: String = "한국어"
    @State private var showingSheet = false

    var date: String = ""
    
    var body: some View {
        VStack(alignment: .leading){

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
            
            Text("\(myvar)") .bold()
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
            
            LanguageSelectionButton(showingSheet: $showingSheet, myvar: $myvar)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 2)
                )
                .padding(.top, 50)
            
            Spacer()
            
        }.sheet(isPresented: $showingSheet) {
            Picker("Flavor", selection: $myvar) {
                ForEach(Language.allCases) { Text($0.rawValue.capitalized).tag($0.rawValue) }
            }
            .pickerStyle(.wheel)
                .presentationDetents([.fraction(0.3)])
            
            
            
        }
    }
}

struct LanguageSelectionButton: View {
    
    @Binding var showingSheet: Bool
    @Binding var myvar: String
    let heights = stride(from: 0.5, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    showingSheet.toggle()
                    
                }, label: {
                    Text("\(myvar)")
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
      
struct ModalView: View {
    
    @State private var selection = 0
    @Binding var showingSheet: Bool
    let data = ["한국어"]
    var body: some View {
        VStack {
     
            Button(action: {
                self.showingSheet = false
            }) {
                HStack {
                    Spacer()
                    Text("Close")
                        .padding(.horizontal, 16)
                }
            }
            Picker(selection: $selection, label: Text("value")) {
                Text("한국어")
            }
            .frame(width: 200)
            .labelsHidden()
        }
    }
}


struct OBLanguageSelectionView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            Color.black
            OBLanguageSelectionView()
        }.ignoresSafeArea()
    }
}
