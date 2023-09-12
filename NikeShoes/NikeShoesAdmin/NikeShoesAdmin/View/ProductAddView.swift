//
//  ProductAddView.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import SwiftUI
import NikeShoesCore

struct ProductAddView: View {
    
    @State private var name: String = ""
    @State private var imageURLString: String = ""
    @State private var minimnumSize: Int = 200
    @State private var maximumSize: Int = 295
    @State private var sizeIncreasing: Int = 5
    @State private var description: String = ""
    @State private var selectedColors: [productColor] = []
    @State private var selectedSpecialities: [Speciality] = []
    @State private var selectedModel: ModelName = .airForce
    @State private var selectedGender: Gender = .male
    @State private var styilingImage: String = ""
    
    private var genders = Gender.allCases
    private var specialities = Speciality.allCases
    private var colors = productColor.allCases
    private var sizeUnits: [Int] = [5, 10]
    private var sizes: [Int] = {
        var result = [Int]()
        var currentValue = 200
        while currentValue <= 300 {
            result.append(currentValue)
            currentValue += 5
        }
        return result
    }()
    
    var body: some View {
        VStack {
            HStack {
                // 이미지 미리보기
                VStack {
                    Text("상품이미지 미리보기")
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 200, height: 200)
                        .padding(.trailing, 20)
                    
                    Button {
                        
                    } label: {
                        Text("미리보기")
                    }
                    
                    Text("스타일링이미지 미리보기")
                    
                }
       
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("이름")
                            TextField("ex)나이키 에어포스", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding(.trailing, 20)
                        
                        
                        VStack(alignment: .leading) {
                            Text("가격(Int)")
                            TextField("ex)00000", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("이미지 URL")
                            TextField("ex)htttps://~~~,https://~~~", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding(.trailing, 20)
                    }
                    .padding(.bottom, 20)
                    
                    HStack(alignment: .top) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("모델종류")
                                Picker("모델종류", selection: $selectedGender) {
                                    ForEach(genders, id: \.self) { model in
                                        Text("\(model.rawValue)")
                                    }
                                }
                            }
//                            Spacer()
                        }
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 2, height: 100)
                            .padding(.horizontal, 10)
                        
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("모델종류")
                                Picker("모델종류", selection: $selectedModel) {
                                    ForEach(ModelName.allCases, id: \.self) { model in
                                        Text("\(model.rawValue)")
                                    }
                                }
                            }
//                            Spacer()
                        }
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 2, height: 100)
                            .padding(.horizontal, 10)
                        
                        VStack(alignment: .center) {
                            Text("최소 사이즈")
                            Picker("최소 사이즈", selection: $minimnumSize) {
                                ForEach(sizes, id: \.self) { size in
                                    Text("\(size)")
                                }
                            }
                        }
                        .padding(.trailing, 20)
                        
                        
                        VStack(alignment: .center) {
                            Text("최대 사이즈")
                            Picker("최대 사이즈", selection: $maximumSize) {
                                ForEach(sizes, id: \.self) { size in
                                    Text("\(size)")
                                }
                            }
                        }
                        .padding(.trailing, 20)
                        
                    
                        VStack(alignment: .center) {
                            Text("사이즈 단위")
                            Picker("사이즈 단위", selection: $sizeIncreasing) {
                                ForEach(sizeUnits, id: \.self) { index in
                                    Text("\(index)")
                                }
                            }
                        }
                        .padding(.trailing, 20)
                    
                        
                        
                        
                        Spacer()
//                        VStack(alignment: .leading) {
//                            Text("카네고리")
//                            Picker("카테고리", selection: $category) {
//                                ForEach(Category.allCases, id: \.self) { category in
//                                    Text(category.rawValue)
//                                }
//                            }
//                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("컬러")
                            HStack(spacing: 20) {
                                ForEach(colors, id: \.self) { item in
                                    Button(action: {
                                        if self.selectedColors.contains(item) {
                                            self.selectedColors.removeAll {
                                                $0.rawValue == item.rawValue
                                            }
                                        } else {
                                            self.selectedColors.append(item)
                                        }
                                    }) {
                                        Text("\(item.rawValue)")
                                            .padding(10)
                                            .background(self.selectedColors.contains(item) ? Color.blue : Color.gray)
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 2, height: 100)
                            .padding(.horizontal, 10)
                        
                        VStack(alignment: .leading) {
                            Text("스페셜")
                            HStack(spacing: 20) {
                                ForEach(specialities, id: \.self) { item in
                                    Button(action: {
                                        if self.selectedSpecialities.contains(item) {
                                            self.selectedSpecialities.removeAll {
                                                $0.rawValue == item.rawValue
                                            }
                                        } else {
                                            self.selectedSpecialities.append(item)
                                        }
                                    }) {
                                        Text("\(item.rawValue)")
                                            .padding(10)
                                            .background(self.selectedSpecialities.contains(item) ? Color.blue : Color.gray)
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("상품 설명")
                        TextEditor(text: $description)
                            .frame(height: 200)
                            .border(.gray)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("본문 URL 이미지(opt)")
                        TextField("ex)https://~~~,https://~~~", text: $styilingImage)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .font(.title)

            }
            
            
            
            Spacer()
            
        }
        .padding()
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
 public var name: String
 public var category: Gender   // Gender : 남성, 여성, 키즈 ,(공용)
 public var modelName: ModelName //  조던 에어 덩크 코르
 public var description: String
 public var price: Int
 public var size: [Int]
 public var colors: [productColor]
 public var imageURLString: [String]
 public var speciality: [Speciality]
 public var stylingImage: [String]
 */


