//
//  SearchView.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/05.
//

import SwiftUI

struct SearchItemView: View {
    
    // 인기 검색어 Top10
    let top10: [String] = ["여름 신발 ", "실버", "골프", "ACG", "신제품", "축구화", "덩크", "에어 포스 1" ]
    // 검색 기록
    @State var searchHistory: [String] = ["조던", "흰색", "덩크"]
    @State var searchText: String = ""
    @FocusState var focused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack { // MARK: SearchBar
                    // Image(Search Icon)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .padding()
                    // TextField
                    TextField("제품 검색", text: $searchText)
                        .focused($focused)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    // .keyboardType(.webSearch)
                        .tint(.black)
                        .onSubmit { // 키보드 엔터 버튼 감지 구역
                            // 예외 처리
                            let trimmedSearchText =
                                searchText.trimmingCharacters(in: .whitespaces) // 텍스트 앞 뒤의 스페이스바를 모두 제거
                            if !trimmedSearchText.isEmpty {// 제대로된 내용으로 검색이 이루어진 경우
                                // 1. 검색 텍스트 순서를 최신 검색에 맞게 바꿔줘야 함 (함수로 만들면 편할 듯)
                                let search = trimmedSearchText // 으 변수명 너무 길다...
                                if searchHistory.isEmpty {
                                    searchHistory.append(search)
                                } else {
                                    for index in 0..<searchHistory.count {
                                        if searchHistory[index] == search {// 기존에 존재한 검색인 경우
                                            searchHistory.remove(at: index)
                                        }
                                    }
                                    searchHistory.insert(search, at: 0)// 맨 앞에 넣어주면 됨
                                }
                                // 2. NavigationLink로 넘어가면 이전 화면이 검색화면 이므로 문제가 될 수 있다.
                                // 2.1 아니면 아예 못돌아오게 Back 버튼을 순기던지
                                
                            } else {// 빈 텍스트 or 스페이스바 밖에 없어서 빈 텍스트로 변한 것
                                // 그냥 아무 동작도 안하는게 좋을듯
                                self.focused = true // 키보드가 계속 올라와 있게 유지
                            }
                        }
                    // Button(delete text)
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
                    
                    // Button(Cancle)
                    Button { // Navigation Pop
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                    .foregroundColor(.gray)
                    .padding()
                }
                Divider()
                // MARK: Search History
                if searchText.isEmpty {
                    HStack {
                        Text("인기 검색어")
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    ScrollView {
                        ForEach(top10, id: \.self) { item in
                            HStack {
                                Button {// 인기 검색어 버튼에 맞게 화면 이동
                                    
                                } label: {
                                    Text(item)
                                        .font(.system(size: 12))
                                }
                                .tint(.black)
                                .padding(.leading, 30)
                                .padding(.top, 10)
                                Spacer()
                            }
                        }
                    }
                } else {
                    HStack { // MARK: Hot Keywords
                        Text("검색 기록")
                            .bold()
                            .padding(.top, 10)
                            .padding(.leading, 30)
                        Spacer()
                        if searchHistory.isEmpty {
                        } else {
                            Button { // 기록이 없으면 버튼이 안뜨게 해야함
                                searchHistory.removeAll()
                            } label: {
                                Text("모두 지우기")
                            }
                            .tint(.gray)
                            .padding(.top, 10)
                            .padding(.trailing, 15)
                        }
                    }
                    ScrollView {
                        ForEach(searchHistory, id: \.self) { item in
                            HStack {
                                Button {
                                    // 1. 누르면 바로 최근 검색순 1위로 올라가야 함
                                    // 어떻게 지울까?
                                    searchHistory.insert(item, at: 0)
                                    for index in 1..<searchHistory.count {
                                         if searchHistory[index] == item {// 기존에 존재한 검색인 경우
                                            searchHistory.remove(at: index)
                                            break
                                        }
                                    }
                                    // 2. 검색어를 들고 해당 뷰로 넘어가야 함
                                } label: {
                                    Text(item)
                                        .font(.system(size: 12))
                                }
                                .tint(.black)
                                .padding(.leading, 30)
                                .padding(.top, 10)
                                Spacer()
                            }
                        }
                    }
                }
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.focused = true
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView()
    }
}
