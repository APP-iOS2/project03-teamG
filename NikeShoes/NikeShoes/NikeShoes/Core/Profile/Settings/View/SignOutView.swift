//
//  SignoutView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct SignOutView: View {
    
    var title: String
    
    @State private var isCheckedBox: Bool = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("계정을 삭제하시겠습니까?")
                    .font(.semiBold24)
                    .padding(.vertical)
                
                
                Text("계정을 삭제할 경우:")
                
                HStack(alignment: .top) {
                    Image(systemName: "link")
                        .frame(width: 40)
                    Text("동일한 이메일 주소 및 전화번호를 사용하는 관련 나이키 앱 계저의 모든 데이터를 잃게 됩니다. 여기에는 NRC, NTC 및 SNKRS가 포함됩니다")
                }
                .padding(.vertical)
                
                HStack(alignment: .top) {
                    Image(systemName: "link")
                        .frame(width: 40)
                    Text("무료 배송, 빠른 결제, 멤버 전용 상품, NRC 러닝 가이드, NTC 운동 프로그램 등 나이키 멤버 혜택을 이용할 수 없게 됩니다.")
                }
                .padding(.vertical)
                
                HStack(alignment: .top) {
                    Image(systemName: "link")
                        .frame(width: 40)
                    Text("나이키 제휴사 사이트, 장비, 미디어 및 컬래버레이션(예: Garmin, Apple Watch등) 연결이 끊기게 됩니다")
                }
                .padding(.vertical)
                
                Text("계정을 삭제하면 이 앱에서 로그아웃됩니다. 다른 나이키 앱에 로그인한 경우, 세션이 만료되기까지 최대 1시간이 소요될 수 있습니다.\n\n계정 삭제 후 주문정보에 액세스 하려면 나이키 고객 서비스팀에 문의해 주세요.\n\n마음이 바뀌면 언제든지 돌아오셔서 새로운 나이키 계정을 만들 수 있습니다.\n")
                
                Text("계정을 삭제하시겠습니까? (취소는 불가능 합니다)\n")
                    .bold()
                
                Button {
                    isCheckedBox.toggle()
                } label: {
                    HStack {
                        // TODO: 나중에 분기 처리 필요
                        isCheckedBox ? Image(systemName: "checkmark.square.fill")
                            .font(.medium20) : Image(systemName: "square")
                            .font(.medium20)

                        Text("예, 계정을 삭제하겠습니다.")
                    }
                    .foregroundColor(.black)
                }
                .padding(.bottom)
                
                Text("요청을 제출하시면 계정을 비활성화해 드립니다. 데이터를 완전히 삭제 및 제거하기까지는 최대 10일이 소요될 수 있습니다.")
                    .padding(.bottom)
                    .font(.medium12)
                
                VStack {
                    CustomButton(background: isCheckedBox ? .black : .defaultGray, foregroundColor: .white, title: "계정 삭제") {
                        //
                    }
                    
                    CustomButton(background: .clear, foregroundColor: .black, title: "취소") {
                        //
                    }
                    
                }
                
            }
            .padding(.horizontal)
        }
        .listStyle(.plain)
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct SignoutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView(title: "계정 삭제")
    }
}
