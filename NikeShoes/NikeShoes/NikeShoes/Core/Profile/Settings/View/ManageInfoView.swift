//
//  ManageInfoView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct ManageInfoView: View {
    var title: String
    var mainDescription: String = "개인 정보 보호 설정은 모든 나이키 앱에 적용됩니다. 하나의 앱에서 설정을 변경하면 모든 앱의 설정이 변경됩니다. 자세한 내용을 확인하려면 개인정보 처리방침 페이지를 방문 하세요."
    var titleAndDescription: [(String, String)] = [
        ("프로필 매칭 기반 맞춤형 광고 허용하기", "이메일 주소와 전화번호를 나이키 광고 협력사와 공유하시면 나이키가 사용자의 관심사를 기반으로 맞춤형 광고를 제공해드릴수 있습니다."),
        ("행동 데이터 기반 맞춤형 광고 허용하기", "광고 목적으로 쿠키, 클릭스트림 데이터 및 기타 기술을 사용합니다. 맞춤형 광고 제공을 위해 사용자 행동 데이터를 광고 네트워크와 공유합니다.")
    ]
    
    @State var allowActive: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(mainDescription)
                .padding()
            
            Button {
                
            } label: {
                Text("개인정보 처리방침")
                    .foregroundColor(.black)
                    .underline()
            }
            .padding()
            
            List {
                ForEach(titleAndDescription, id: \.0) { titleAndDescription in
                    VStack(alignment: .leading) {
                        HStack {
                            Toggle(titleAndDescription.0, isOn: $allowActive)
                                .font(.medium20)
                        }
                        Text(titleAndDescription.1)
                            .font(.medium16)
                            .padding(.trailing, 60)
                    }
                    .padding(.vertical)
                }
            }
            .listStyle(.plain)
        }
        .lineSpacing(4)
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct ManageInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ManageInfoView(title: "개인 정보 관리")
    }
}
