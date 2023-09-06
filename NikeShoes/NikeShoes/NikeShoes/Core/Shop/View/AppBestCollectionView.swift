//
//  AppBestCollectionView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/05.
//

import SwiftUI

struct AppBestCollectionView: View {

    var sampleCollections: [String] = ["앱 전용 제품", "신제품", "이번 주 베스트", "러닝화 가이드", "전체 제품 보기"]


    

    var body: some View {
        VStack(alignment: .leading) {
            
            Text("나이키 앱 베스트 컬렉션")
                .font(Font.medium20)
                .padding(.leading,20)
            
            //가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {

                    ForEach(sampleCollections, id: \.self) { collection in

                        NavigationLink(destination: ItemListView()) { // ItemListView로 이동


                            VStack(alignment: .leading){
                                AsyncImage(url: URL(string: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASoAAACpCAMAAACrt4DfAAAAb1BMVEURERH///8AAAANDQ0JCQkFBQU+Pj7Hx8dCQkKlpaXz8/OqqqqZmZnu7u6WlpbZ2dm3t7dSUlLi4uL5+fl1dXWDg4PNzc19fX1ra2s4ODhfX18dHR1aWlplZWUhISFNTU0wMDCOjo7IyMi0tLQnJydaIyg1AAACTUlEQVR4nO3ai3KqMBSFYfcGRFREPN5abavV93/GQxJtKaLVSqcO+b8HyLjXZAWidjoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4Jmw+SWjqPk1H4DmzWYVqGr+vGp0zceggyBobDET02oW79ba2JKPQ5NhU2MVMenLLpXkVVuZ1EK0iU0VFjG9DTORyVQbWfDhaC6Du3eAad1mFv8TkXGvlRuqEO1Func9rExMOh2nRUzSHwbaziefmTOV9I5dYGJ6TiZiZW1tnqWx/Lh/5nDqjeZy0N7mWbotZpz+YELTur07nMQ1L2p1UB3tmTFvPqpM65a7VD60u3mGOagKN01ZbB5dJ5mUtLx5lg7kpqhM67rbeTmmonna2mfeJ1c/katuNSamziLuf8nJg+Y5eqhR/m197OE0mEiFD82zdHmYeHRxXvNKkA+zakyeNM/R4y45/wpq7yvb95OY/GmepS8fcy/qsjIxBdNxvyYnf5rnaOlJ9lQd3N5XTg8n17yRP82zgk55/Lw0fHT8MqWWV81z7JWmVKmuHnVL9xXPm+do9bBO40GS7OL60vnZvAM9u3PONW/pXfOc8PW2oExB//oz/xF9uyEnX5vnlN6qaN5luqZ5V4qeaN61lOZdy/z+QPOuovmlnFKaV3JhW9G8rw6/QZza0byqKKi572Uzmlcj1KSS03ZP8+oFGowyd23uz5PigNJf+KNjW9hvhTeblf2iiv30nSAMG/x/IwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAW+A/LuBLY6LM58wAAAABJRU5ErkJggg==")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)

                                Text("\(collection)")
                                    .foregroundColor(.black)
                                    .font(Font.semiBold12)

                                    .padding([.top,.leading],10)

                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct AppBestCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // 별도의 NavigationView로 미리보기 설정
            AppBestCollectionView()
                .frame(height: 280)
        }
    }
}
