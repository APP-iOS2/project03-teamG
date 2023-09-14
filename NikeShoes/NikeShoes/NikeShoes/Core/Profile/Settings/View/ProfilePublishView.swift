//
//  ProfilePublishView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct ProfilePublishView: View {
    var title: String
    
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.defaultGray)
                .frame(height: 130)
                .overlay {
                    Text("개인 정보 보호 설정이 모든 Nike 앱에 적용됩니다. 하나의 앱에서 설정을 변경하면 모든 앱의 설정이 변경됩니다.")
                        .font(.medium16)
                        .padding(.vertical)
                }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("공개 (모두에게)")
                        .font(.bold16)
                        .padding(.vertical)
        
                    Text("모든 나이키 멤버가 나를 검색하고, 나의 전체 프로필을 보고, 초대를 보내고, 나의 활동을 확인할 수 있습니다.")
                        .font(.medium16)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    selectedIndex = 0
                } label: {
                    if selectedIndex == 0 {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("소셜 (친구만)")
                        .font(.bold16)
                        .padding(.vertical)
                
                    Text("""
모든 나이키 멤버가 나를 검색하고, 나의 제한된 프로필을 보고, 초대를 보낼 수 있습니다.
친구들만이 나의 전체 프로필을 보고 나의 활동을 확인할 수 있습니다.
그룹에 공유한 활동은 그룹 내 다른 구성원들도 볼 수 있습니다.
""")
                        .font(.medium16)
                }
                .padding(.horizontal)
                
                Spacer()
                Button {
                    selectedIndex = 1
                } label: {
                    if selectedIndex == 1 {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("비공개 (나만)")
                        .font(.bold16)
                        .padding(.vertical)
                
                    Text("""
어떤 사용자도 나를 검색하거나 나의 프로필 및 활동을 볼 수 없습니다.
친구를 추가할 수 없습니다.
소셜 네트워크에 활동을 공유하면, 해당 네트워크에 연결된 모든 친구가 이활동을 볼 수 있습니다.
""")
                        .font(.medium16)
                }
                .padding(.horizontal)
                
                Spacer()
                Button {
                    selectedIndex = 2
                } label: {
                    if selectedIndex == 2 {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "checkmark.circle")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            Spacer()
        }
        .lineSpacing(4)
        .modifier(NavigationNikeSetting(title: title))
    }
    
}

struct ProfilePublishView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePublishView(title: "프로필 공개 설정")
    }
}
