//
//  GenderTabView.swift
//  NikeShoes
//
//  Created by 박찬호 on 2023/09/11.
//

import SwiftUI

// MARK: - 문자열 확장
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes).width
    }
}

// MARK: - TabButton 뷰
struct TabButton: View {
    let tab: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(tab)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(isSelected ? .black : .gray)
                .frame(height: 50)
        }
    }
}

// MARK: - 주 GenderTabBarView
struct GenderTabBarView: View {
    @State private var selectedTab: String
    @State private var progressBarOffset: CGFloat = 0
    @State private var progressBarWidth: CGFloat = 0
    
    var tabs: [String]
    
    init(tabs: [String]) {
        self.tabs = tabs
        _selectedTab = State(initialValue: tabs.first ?? "")
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TabBarView(tabs: tabs, selectedTab: $selectedTab, progressBarOffset: $progressBarOffset, progressBarWidth: $progressBarWidth)
                SelectedContentView(selectedTab: $selectedTab)
                Spacer()
            }
        }
        .navigationBarTitle("구매하기", displayMode: .automatic)
        .toolbar { SearchView() }
    }
}

// MARK: - TabBarView
struct TabBarView: View {
    var tabs: [String]
    @Binding var selectedTab: String
    @Binding var progressBarOffset: CGFloat
    @Binding var progressBarWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(tabs, id: \.self) { tab in
                        GeometryReader { geometry in
                            TabButton(tab: tab, isSelected: selectedTab == tab) {
                                self.selectedTab = tab
                                withAnimation {
                                    let newOffset = geometry.frame(in: .global).minX
                                    let newWidth = tab.widthOfString(usingFont: UIFont.systemFont(ofSize: 16, weight: .bold))
                                    
                                    if newOffset.isFinite && newWidth.isFinite {
                                        self.progressBarOffset = newOffset
                                        self.progressBarWidth = newWidth
                                    }
                                }
                            }
                            .onAppear {
                                if self.selectedTab == tab {
                                    let newOffset = geometry.frame(in: .global).minX
                                    let newWidth = tab.widthOfString(usingFont: UIFont.systemFont(ofSize: 16, weight: .bold))
                                    
                                    if newOffset.isFinite && newWidth.isFinite {
                                        self.progressBarOffset = newOffset
                                        self.progressBarWidth = newWidth
                                    }
                                }
                            }
                        }
                        .frame(width: tab.widthOfString(usingFont: UIFont.systemFont(ofSize: 16, weight: .bold)) + 20, height: 40)
                    }
                }
                .padding(.horizontal)
            }
            ProgressBarView(offset: $progressBarOffset, width: $progressBarWidth)
        }
        .background(Color.white)
    }
}

// MARK: - ProgressBarView
struct ProgressBarView: View {
    @Binding var offset: CGFloat
    @Binding var width: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color.gray.opacity(0.5))
            Rectangle()
                .frame(width: width, height: 2)
                .foregroundColor(.black)
                .offset(x: offset)
        }
    }
}

// MARK: - SelectedContentView
struct SelectedContentView: View {
    @Binding var selectedTab: String
    
    var body: some View {
        switch selectedTab {
        case "남성":
            ShopView(categoryView: MaleView(), currentGender: "남성")  // 수정된 부분
        case "여성":
            ShopView(categoryView: FemaleView(), currentGender: "여성")  // 수정된 부분
        case "키즈":
            ShopView(categoryView: KidsView(), currentGender: "키즈")  // 수정된 부분
        default:
            Text("\(selectedTab) 탭 컨텐츠")
                .padding()
        }
    }
}


// MARK: - SearchView
struct SearchView: View {
    var body: some View {
        NavigationLink(destination: /* 나중에 SearchItemView로 대체될 예정 */
                       SearchItemView()) {
            Image(systemName: "magnifyingglass").foregroundColor(.black)
        }
    }
}

// MARK: - 미리보기
struct GenderTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        GenderTabBarView(tabs: ["남성", "여성", "키즈"])
    }
}
