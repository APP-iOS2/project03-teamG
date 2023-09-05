//
//  ShopView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                
                AppBestCollectionView()
                    .frame(height: 250)
                
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { _ in
                        VStack{
                            ZStack{
                                Rectangle()
                                    .frame(width: .infinity, height: 120)
                                Text("카테고리")
                                    .foregroundColor(Color.white)
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
