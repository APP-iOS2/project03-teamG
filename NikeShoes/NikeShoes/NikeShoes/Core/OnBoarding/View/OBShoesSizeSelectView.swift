//
//  OnBoardingStart.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBShoesSizeSelectView: View {
    
    @EnvironmentObject var obViewModel: OBViewModel
    @Binding var index: Int
    
    @State var isSelected: [Bool] = Array(repeating: false, count: 16)
    
    var description: String = "신발 사이즈를 알려주세요."
    
    var sizes: [Int] = (0..<16).reduce(into: [Int]()) { sizes, _ in
        sizes.isEmpty ? sizes.append(215) : sizes.append(sizes.last! + 5)
    }
    
    private var selectedSizes: [Int] {
        let selectedIndex = isSelected.enumerated().compactMap { index, flag in
            if flag {
                return index
            } else {
                return nil
            }
        }
        
        return sizes.enumerated()
            .compactMap { index, value  in
                if selectedIndex.contains(index) {
                    return value
                } else {
                    return nil
                }
            }
    }
    
    var body: some View {
        VStack(alignment: .leading ) {
            Spacer()
            
            HStack {
                Text("\(description)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
            }
            
            BoxView(sizes: sizes, isSelected: $isSelected)
            
            Spacer(minLength: 300)
            HStack {
                Spacer()
                TempButton(title: OBScreen.sizeSelection.title) {
                    Task {
                        await obViewModel.updateMyShoesSize(sizes: selectedSizes)
                        index += 1
                    }
                }.padding(20)
                Spacer()
            }
        }
    }
}

struct BoxView: View {
    
    let sizes: [Int]
    @Binding var isSelected: [Bool]
    
    var body: some View {
        VStack {
            ForEach(0..<4) { row in
                HStack {
                    Spacer()
                    ForEach(0..<4) { col in
                        ZStack {
                            Button(action: {
                                isSelected[(row + col + (3 * row))].toggle()
                            }, label: {
                                Text("\(sizes[(row + col + (3 * row))])")
                                    .font(.body)
                                    .foregroundColor(isSelected[(row + col + (3 * row))] ? Color.black : Color.white)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 20)
                            })
                        }.background(isSelected[(row + col + (3 * row))] ? Color.white : Color.black.opacity(0.3) )
                            .cornerRadius(10.0)
                            .padding(1)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct OBShoesSizeSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Blur(style: .light)
            OBShoesSizeSelectView(index: .constant(1))
        }.ignoresSafeArea()
    }
}
