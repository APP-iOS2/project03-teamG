//
//  ProductEditView.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import SwiftUI
import NikeShoesCore
struct ProductEditView: View {
    
    @Binding var shoes: ShoesDTO
    
    @State var name: String = ""
    
    var body: some View {
        VStack {
            HStack {
                if shoes.imageURLString.count > 0 {
                    AsyncImage(url: URL(string: shoes.imageURLString[0])!) { image in
                        image.resizable()
                            .frame(width: 300, height: 300)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                TextField("제품명", text: $shoes.name)
            }
        }
    }
}

//struct ProductEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductEditView(shoes: .constant(ShoesSampleData[0]))
//    }
//}
