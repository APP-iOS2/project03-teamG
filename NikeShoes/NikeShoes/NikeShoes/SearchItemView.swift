//
//  SearchView.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/05.
//

import SwiftUI

struct SearchItemView: View {
    
    //인기 검색어 Top10
    let top10: [String] = ["여름 신발 ", "실버", "골프", "ACG", "신제품", "축구화", "덩크", "에어 포스 1" ]
    //검색 기록
    @State var searchHistory: [String] = ["조던","흰색", "덩크"]
    @State var searchText: String = ""
    @FocusState var focused: Bool
    
    var body: some View {
        VStack{
            HStack{ //MARK: SearchBar
                //Image(Search Icon)
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                    .padding()
                //TextField
                TextField("제품 검색", text: $searchText)
                    .focused($focused)
                    //.keyboardType(.webSearch)
                    .tint(.black)
                //Button(delete text)
                if searchText.isEmpty {
                    
                } else {
                    Button {
                        searchText = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                    .tint(.gray)
                }
                
                //Button(Cancle)
                Button { //Navigation Pop
                    
                } label: {
                    Text("취소")
                }
                .foregroundColor(.gray)
                .padding()
            }
            Divider()
            //MARK: Search History
            if searchText.isEmpty {
                HStack {
                    Text("인기 검색어")
                        .bold()
                        .padding(.top, 10)
                        .padding(.leading, 30)
                    Spacer()
                }
                ForEach(top10, id: \.self){ item in
                    HStack {
                        Button {//인기 검색어 버튼에 맞게 이동
                            
                        } label: {
                            Text(item)
                        }
                        .tint(.black)
                        .padding(.leading, 30)
                        .padding(.top, 10)
                        Spacer()
                    }
                }
            } else {
                HStack { //MARK: Hot Keywords
                    Text("검색 기록")
                        .bold()
                        .padding(.top, 10)
                        .padding(.leading, 30)
                    Spacer()
                    if searchHistory.isEmpty {}
                    else {
                        Button { //기록이 없으면 버튼이 안뜨게 해야함
                            searchHistory.removeAll()
                        } label: {
                            Text("모두 지우기")
                        }
                        .tint(.gray)
                        .padding(.top, 10)
                        .padding(.trailing, 15)
                    }
                }
                ForEach(searchHistory, id: \.self){ item in
                    HStack {
                        Button {
                            
                        } label: {
                            Text(item)
                        }
                        .tint(.black)
                        .padding(.leading, 30)
                        .padding(.top, 10)
                        Spacer()
                    }
                }
            }
            
            Spacer()
            
            //
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.focused = true
            }
        }
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
