//
//  ShopView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ScrollView {
            Text("나이키 앱 베스트 컬렉션")
                .font(.headline)
                .padding()
            
            //가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0 ... 10, id: \.self) { _ in
                        VStack{
                            Rectangle()
                                .frame(width: 130, height: 130)
                                .cornerRadius(15)
                            Text("Category")
                        }
                        
                    }
                }
                .padding()
            }
            
            LazyVStack {
                ForEach(0 ... 10, id: \.self) { _ in
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: 500, height: 120)
                            Text("카테고리")
                                .foregroundColor(Color.white)
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
