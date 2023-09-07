//
//  LocationView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var filteredCountries: [String] = countries
    
    let title: String
    
    @State private var nation: String = ""
    
    var body: some View {
        
        VStack{
            Divider()
            
            TextField("검색", text: $nation)
                .onChange(of: nation) { newValue in
                    if newValue.isEmpty {
                        filteredCountries = countries
                    } else {
                        filteredCountries = countries.filter { $0.contains(newValue) }
                    }
                }
                .padding(15)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                .padding()
            List{
                ForEach(filteredCountries, id: \.self) { item in
                    Text(item)
                        .font(.subheadline)
                }
            }
            .listStyle(.plain)
        }
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            LocationView(title: "국가 / 지역")
        }
    }
}

let countries = [
    "가나",
    "가봉",
    "가이아나",
    "감비아",
    "그리스",
    "그린란드",
    "그레나다",
    "괌",
    "기니",
    "기니비사우",
    "나미비아",
    "나우루",
    "나이제리아",
    "남아프리카",
    "남수단",
    "네덜란드",
    "네팔",
    "노르웨이",
    "뉴질랜드",
    "니카라과",
    "대만",
    "덴마크",
    "도미니카",
    "도미니카공화국",
    "독일",
    "동티모르",
    "라오스",
    "라이베리아",
    "라트비아",
    "러시아",
    "레바논",
    "루마니아",
    "룩셈부르크",
    "르완다",
    "리비아",
    "리투아니아",
    "리히텐슈타인",
    "마다가스카르",
    "마쉬얼 제도",
    "마카오",
    "마케도니아",
    "말라위",
    "말레이시아",
    "말리",
    "멕시코",
    "모나코",
    "몰디브",
    "몰타",
    "몽골",
    "미국"
]
