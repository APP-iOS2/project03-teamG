//
//  OBselectInterestView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBInterestSelectView: View {
    
    var description: String = "관심 있는 항목을 모두 선택해 주세요. (중복 선택 가능)"
  
    var sizes: [Int] = (0..<16).reduce(into: [Int]()) { sizes, _ in
        sizes.isEmpty ? sizes.append(215) : sizes.append(sizes.last! + 5)
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    HStack {
                        Text("\(description)")
                            .font(.system(size: 26))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 30)
                            .padding(.horizontal, 10)
                        
                    }
                    .padding(.bottom, 30)
                }.listRowBackground(Color.clear)
                InterestListView().background(.clear)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            
            Spacer()
        }
        
    }
}

#if DEBUG
extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
#endif

struct InterestListView: View {
    
    var interestList = ["러닝", "트레이닝 및 짐", "라이프스타일", "농구", "축구", "조던", "SNKRS", "남아", "여아", "스케이트보딩", "요가", "골프", "테니스"]

    var color: Color {
        Color.random()
    }
    
    var body: some View {
        ForEach(0..<interestList.count) { value in
            HStack {
                HStack {
                    Circle()
                        .foregroundColor(color)
                        .frame(width: 55, height: 55)
                    
                    Text("\(interestList[value])")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.white.opacity(0.5))
                        .padding(10)
                }
                Spacer()
                
                Circle()
                    .strokeBorder(.white.opacity(0.5), lineWidth: 1)
                    .frame(width: 25, height: 25)
                    .padding(20)
            }
        }.listRowBackground(Color.clear)
    }
}

struct OBInterestSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Blur(style: .light)
            OBInterestSelectView()
                .padding(.top, 30)
        }.ignoresSafeArea()
    }
}
