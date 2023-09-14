//
//  BagViewModel.swift
//  NikeShoes
//
//  Created by Chloe Chung on 2023/09/14.
//

import Foundation
import NikeShoesCore

class BagViewModel: ObservableObject {
    @Published var bagArray: [ShoesDTO]
    
    init() {
        bagArray = []
    }
    
    func addToBag(shoesData: ShoesDTO) {
        bagArray.append(shoesData)
    }
    
//    func removeFromBag(shoesData: ShoesDTO) {
//        if let index = bagArray.firstIndex(of: shoesData) {
//            bagArray.remove(at: index)
//        }
//    }
}

let defaultText: String = """
     장바구니가 비어있습니다.
제품을 추가하면 여기에 표시됩니다.
"""
