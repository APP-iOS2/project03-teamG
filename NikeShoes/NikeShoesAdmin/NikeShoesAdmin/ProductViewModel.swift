//
//  ProductViewModel.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import Foundation

class ProductViewModel: ObservableObject {
    
    @Published var shoes: [Shoes] = ShoesSampleData
    
}
