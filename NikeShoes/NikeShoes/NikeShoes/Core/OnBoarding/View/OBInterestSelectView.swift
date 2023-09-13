//
//  OBselectInterestView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI
import NikeShoesCore

struct OBInterestSelectView: View {
    
    @EnvironmentObject var obViewModel: OBViewModel
    @Binding var index: Int
    
    @State var following = [
        Following(title: "여성", imageURL: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg",isChecked: false),
        Following(title: "남성", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH1ZzKaQLfmdVu21LzzSoWS3kdhITFjjMFyw&usqp=CAU", isChecked: false),
        Following(title: "키즈", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrrG44ZqsHrJlOVTT2MhJONM2n1yGWf4rVA&usqp=CAU", isChecked: false),
        Following(title: "러닝", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrrG44ZqsHrJlOVTT2MhJONM2n1yGWf4rVA&usqp=CAU", isChecked: false),
        Following(title: "트레이닝 및 짐", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrrG44ZqsHrJlOVTT2MhJONM2n1yGWf4rVA&usqp=CAU", isChecked: false),
        Following(title: "라이프스타일", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrrG44ZqsHrJlOVTT2MhJONM2n1yGWf4rVA&usqp=CAU", isChecked: false),
        Following(title: "농구", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrrG44ZqsHrJlOVTT2MhJONM2n1yGWf4rVA&usqp=CAU", isChecked: false)
    ]
    
    var description: String = "관심 있는 항목을 모두 선택해 주세요. (중복 선택 가능)"
  
    var sizes: [Int] = (0..<16).reduce(into: [Int]()) { sizes, _ in
        sizes.isEmpty ? sizes.append(215) : sizes.append(sizes.last! + 5)
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    HStack {
                        Text("\(description)")
                            .font(.system(size: 26))
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 30)
                            .padding(.horizontal, 10)
                        
                    }
                    .padding(.bottom, 30)
                }.listRowBackground(Color.clear)
                InterestListView(following: $following).background(.clear)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            
            Spacer()
            
            TempButton(title: OBScreen.interest.title) {
                Task {
                    let following = following.filter { $0.isChecked == true }
                    await obViewModel.updateInterest(interest: following)
                    index += 1
                }
            }.padding(20)
        }
        
    }
}

#if DEBUG
extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
#endif

struct InterestListView: View {
    
    @Binding var following: [Following]
    
    var color: Color {
        Color.random()
    }
    
    var body: some View {
        ForEach(0..<following.count) { value in
            HStack {
                HStack {
                    AsyncImage(url: URL(string: following[value].imageURL)!,
                               content: { image in
                        image
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 55, height: 55)
                    }, placeholder: {
                        ProgressView()
                            .frame(width: 55, height: 55)
                    })
   
                    Text("\(following[value].title)")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.white.opacity(0.5))
                        .padding(10)
                }
                Spacer()
                
                Button(action: {
                    following[value].isChecked.toggle()
                }, label: {
                    Circle()
                        .stroke(.white.opacity(0.5), lineWidth: 1)
                        .background(following[value].isChecked ? Circle().fill(.gray) : Circle().fill(.clear))
                        .frame(width: 25, height: 25)
                        .padding(20)
                })
               
            }
        }.listRowBackground(Color.clear)
    }
}

struct OBInterestSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Blur(style: .light)
            OBInterestSelectView(index: .constant(3))
                .padding(.top, 30)
        }.ignoresSafeArea()
    }
}
