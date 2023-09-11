//
//  ProductEditView.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import SwiftUI

struct ProductEditView: View {
    
    @Binding var shoes: Shoes
    @State var name: String = ""
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: shoes.imageURL) { image in
                    image.resizable()
                        .frame(width: 300, height: 300)
                } placeholder: {
                    ProgressView()
                }
                
                TextField("제품명", text: $shoes.name)
            }
        }
    }
}

struct ProductEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProductEditView(shoes: .constant(ShoesSampleData[0]))
    }
}
//
//struct Shoes: Identifiable, ImageURL, Hashable {
//
//    let id: UUID = UUID()
//    var name: String
//    var category: Category
//    var modelName: ModelName
//    var price: Int
//    var size: [Int]
//    var description: String
//    var imageURLString: String
//    var like: Bool
//
//    var imageURL: URL {
//        get {
//            return URL(string: imageURLString)!
//        }
//    }
//}
