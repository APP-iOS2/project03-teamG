//
//  ProductAddView.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import SwiftUI
import NikeShoesCore
import FirebaseFirestoreSwift

struct ProductEditView: View {
    
    @ObservedObject var viewModel: ProductViewModel
    @Environment (\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var imageURLString: [String] = []
    @State private var stylingImage: [String] = []
    @State private var minimumSize: Int = 200
    @State private var maximumSize: Int = 295
    @State private var sizeIncreasing: Int = 5
    @State private var description: String = ""
    @State private var selectedColors: [ProductColor] = []
    @State private var selectedSpecialities: [Speciality] = []
    @State private var selectedModel: ModelName = .airForce
    @State private var selectedGender: Gender = .male
    @State private var imageURLs: [URL] = []
    
    private let genders = Gender.allCases
    private let specialities = Speciality.allCases
    private let colors = ProductColor.allCases
    private let sizeUnits: [Int] = [5, 10]
    private let sizes: [Int] = {
        var result = [Int]()
        var currentValue = 200
        while currentValue <= 300 {
            result.append(currentValue)
            currentValue += 5
        }
        return result
    }()
    
    var shoes: ShoesDTO
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    
                    HStack {
                        Button {
                            let images = imageURLString + stylingImage
                            var urlImages: [URL] = []
                            images.forEach { urlString in
                                if let url = URL(string: urlString) {
                                    urlImages.append(url)
                                }
                            }
                            imageURLs = urlImages
                        } label: {
                            Text("이미지 미리보기")
                                .frame(width: 100, height: 100)
                        }
                        .buttonStyle(.bordered)
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(imageURLs, id: \.self) { url in
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                            .scaledToFit()
                                            .frame(width: 200)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 200)
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 8)
                        .padding(.vertical)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("모델 이름")
                            TextField("ex)나이키 에어포스", text: $name)
                                .textFieldStyle(.roundedBorder)
                        }
                        .padding(.trailing, 20)
                        
                        
                        VStack(alignment: .leading) {
                            Text("가격(Int)")
                            TextField("ex)00000", text: $price)
                                .textFieldStyle(.roundedBorder)
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("이미지 URL")
                                Button(action: {
                                    // 버튼을 누를 때마다 새로운 텍스트 필드를 추가
                                    imageURLString.append("")
                                }) {
                                    Text("추가")
                                }
                                .buttonStyle(.borderedProminent)
                                Spacer()
                            }
                            ForEach(0..<imageURLString.count, id: \.self) { index in
                                HStack {
                                    TextField("ex)https://www.google.com", text: $imageURLString[index])
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(.horizontal)
                                    
                                    Button(action: {
                                        imageURLString.remove(at: index)
                                    }) {
                                        Text("삭제")
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .tint(.red)
                                }
                                
                            }
                            .transition(.opacity)
                        }
                        .animation(.default, value: imageURLString.count)
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("본문 이미지 URL")
                                Button(action: {
                                    // 버튼을 누를 때마다 새로운 텍스트 필드를 추가
                                    stylingImage.append("")
                                }) {
                                    Text("추가")
                                }
                                .buttonStyle(.borderedProminent)
                                Spacer()
                            }
                            ForEach(0..<stylingImage.count, id: \.self) { index in
                                HStack {
                                    TextField("ex)https://www.google.com", text: $stylingImage[index])
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding(.horizontal)
                                    
                                    Button(action: {
                                        stylingImage.remove(at: index)
                                    }) {
                                        Text("삭제")
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .tint(.red)
                                }
                                
                            }
                            .transition(.opacity)
                        }
                        .animation(.default, value: stylingImage.count)
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
                        
                        
                        
                        
                        Spacer()
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        
                        VStack(alignment: .center) {
                            Text("최소 사이즈")
                            Picker("최소 사이즈", selection: $minimumSize) {
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
                    }
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
                        Spacer()
                    }
                    
                    HStack {
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
                    
                }
                .font(.title)
            }
            .onAppear {
                setupShoesUI()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            await updateShoesDTO()
                            dismiss()
                        }
                    } label: {
                        Text("수정완료")
                    }
                }
            }
            .padding()
        }
    }
    
    private func updateShoesDTO() async {
        
        
        let shoesUpdateField: [String: Any] = [
            "name": name,
            "category": selectedGender.rawValue,
            "modelName": selectedModel.rawValue,
            "description": description,
            "price": Int(price) ?? 0,
            "size": sizes,
            "colors": selectedColors.map {$0.rawValue},
            "imageURLString": imageURLString,
            "speciality": selectedSpecialities.map {$0.rawValue},
            "stylingImage": stylingImage
        ]
        do {
            try await viewModel.updateShoes(id: shoes.id!, shoesUpdateField: shoesUpdateField)
        } catch {
            error
        }
    }
    
    private func setupShoesUI() {
        var sizeIncreasing: Int = 5
        var minimumSize: Int = 200
        var maximumSize: Int = 300
        if shoes.size.count > 2 {
            sizeIncreasing = shoes.size[1] - shoes.size[0]
            minimumSize = shoes.size.first!
            maximumSize = shoes.size.last!
        }
        
        name = shoes.name
        price = String(shoes.price)
        imageURLString = shoes.imageURLString
        stylingImage = shoes.stylingImage
        self.minimumSize = minimumSize
        self.maximumSize = maximumSize
        self.sizeIncreasing = sizeIncreasing
        description = shoes.description
        selectedColors = shoes.colors
        selectedSpecialities = shoes.speciality
        selectedModel = ModelName(rawValue: shoes.modelName) ?? .airForce
        selectedGender = Gender(rawValue: shoes.category) ?? .female
    }
    
    private func makeSizeList() -> [Int] {
        var result = [Int]()
        var currentValue = minimumSize
        while currentValue <= maximumSize {
            result.append(currentValue)
            currentValue += sizeIncreasing
        }
        return result
    }
    
    private func makeURLStrings(inputString: String) -> [String] {
        let separator: String = "https://"
        let components = inputString.split(separator: separator)
        if components.count > 0 {
            let resultArray = components.map { "https://" + $0 }
            return resultArray
        } else {
            return []
        }
    }
}

struct ProductEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductEditView(viewModel: ProductViewModel(), shoes: ShoesDTO(name: "나이키 에어포스", category: "키즈", modelName: "에어 포스 1", description: "에어포스", price: 150000, size: [220,240,290], colors: [.black], imageURLString: ["data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHcAAAB3CAMAAAAO5y+4AAAAaVBMVEX///8AAADl5eX29vb5+fm8vLzs7OzKyspOTk7g4ODY2Nj8/PySkpKMjIyenp6bm5saGhrQ0NBcXFx1dXWnp6dtbW07Ozuurq7CwsIyMjJoaGh8fHxTU1MVFRUsLCwjIyNHR0eEhIQNDQ20t47jAAACCElEQVRoge3XyZaDIBAF0C6N4DzHKWpM/v8jWzO0RhHB4KLPqbsN+CJQCD8/CCGEEEIIIYQQQgj9O9phT9Z1zo8GPSZUK1Kbk0trR32mbrvVOeK1sKFQHUryJASPP3sEypPKTId6GUCbb41hC4G6UNuPoRdvL5i+HVGTqeVneLgJlEcAYCrIJIXXPkOvPq9y3mjf0v0yU4/8LnyGgmkIrRUy/MmvitcyqhLeqkiwIKuh9e7VTOjN/MuE8GKJdswfHXZl6lYQX8dQKAPx1ak1Q49MPpQYlxKmOrFpfXmUmnQu9Uz4JFCtU8Wz112ii5VWMCdSrR/e0yO4BvvBXWRC6Et/UtJ3X2O7rU7dbBkKtUDXOWecno2Gdl6HjFA42/Kpk9flvrBmJKwX7Qd44yu3qpk8hP3HSeSZDTMUsnTvt4ROH3NffPj1fuW27MxhExbZ+tmS+VyN69LpVy57cB8q7uFly3LobnlkW7YRrEzoy95pfaG8Z69q5Kt1xt2Raio4/iXbMTOJ8FeOJ5YLvbtqzmBOLZPapfvrZkbifeNC4fFadH6bZNcmvCoQSg1d1RdFSyC1zZXeX564m9LAPOZuurFhiZ9JZS0PSiNXWd0wrJVwvXmD/NKNEdq5hw3wKPoc62vsWwesYBYrr7qsbLPOTFJb0TVY1ImQI5cRQgghhBBCCCGEEELifgEUhRRaGyMaJgAAAABJRU5ErkJggg=="], speciality: [.hot, .newProduct], stylingImage: []))
        }
    }
}
