//
//  ProductAddView.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import SwiftUI

struct ProductAddView: View {
    
    @State private var name: String = ""
    @State private var category: Category?
    
    var body: some View {
        VStack {
            HStack {
                // 이미지 미리보기
                Rectangle()
                    .fill(.gray)
                    .frame(width: 400, height: 400)
                    .padding(.trailing, 20)
                // 이름. 카테고리, 모델 네임
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("이름")
                            TextField("이름을 입력해주세요", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding(.trailing, 20)
                        
                        VStack(alignment: .leading) {
                            Text("카네고리")
                            Picker("카테고리", selection: $category) {
                                ForEach(Category.allCases, id: \.self) { category in
                                    Text(category.rawValue)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("이름")
                            TextField("이름을 입력해주세요", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding(.trailing, 20)
                        
                        VStack(alignment: .leading) {
                            Text("모델명")
                            TextField("모델명을 입력해주세요", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("이름")
                            TextField("이름을 입력해주세요", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding(.trailing, 20)
                        
                        VStack(alignment: .leading) {
                            Text("모델명")
                            TextField("모델명을 입력해주세요", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                    }
                    .padding(.bottom, 20)
                    
                }
                .font(.title)

            }
            Spacer()
            
        }.padding()
    }
}

struct ProductAddView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAddView()
    }
}
/*
 struct Shoes: Identifiable, ImageURL, Hashable {

     let id: UUID = UUID()
     var name: String
     var category: Category
     var modelName: ModelName
     var price: Int
     var size: [Int]
     var description: String
     var imageURLString: String
     var like: Bool
     
     var imageURL: URL {
         get {
             return URL(string: imageURLString)!
         }
     }
 struct ShoesDTO: Codable, Identifiable {
 var id: String = UUID().uuidString
 var name: String
 var category: Category   // Gender : 남성, 여성, 키즈 ,(공용)
 var modelName: ModelName //  조던 에어 덩크 코르
 var description: String
 var price: Int
 var size: [Int]
 var colors: [String]
 var imageURLString: [String]
 var speciality: [Speciality]
 }
 */
