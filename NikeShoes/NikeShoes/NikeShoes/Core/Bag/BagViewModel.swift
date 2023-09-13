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
}

