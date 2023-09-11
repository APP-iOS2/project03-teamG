//
//  ProfileEditView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/08.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var isProfileEditClicked: Bool
    @State private var firstName: String = "김"
    @State private var lastName: String = "성준"
    @State private var address: String = "거주지/도시"
    @State private var introContent: String = "안녕하세요"
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    isProfileEditClicked = false
                } label: {
                    Text("취소")
                }
                .tint(.black)
                Spacer()
                Button {
                    
                } label: {
                    Text("저장")
                }
                .tint(Color.textGray)
            }
            .padding(.horizontal, 8)
            
            VStack(spacing: 0) {
                Image(systemName: "camera.circle.fill")
                    .font(.system(size: 125))
                Text("수정")
            }
            .padding(0)
            
            List {
                Section("이름") {
                    VStack(alignment: .leading, spacing: 0) {
                        TextField("성", text: $firstName)
                            .foregroundColor(.primary)
                        Divider()
                            .padding(.vertical, 8)
                        TextField("이름", text: $lastName)
                            .foregroundColor(.primary)
                            
                    }
                    
                    .modifier(ProfileEditListStyle())
                }
                
                Section("활동지역 및 거주지") {
                    TextField("거주지/도시", text: $address)
                        .foregroundColor(.primary)
                        .modifier(ProfileEditListStyle())
                }
                
                Section("자기소개") {
                    TextEditor(text: $introContent)
                    .frame(height: 150)
                    .foregroundColor(.primary)
                    .modifier(ProfileEditListStyle())
                }
            }
            .listStyle(InsetListStyle())
        }
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(isProfileEditClicked: .constant(true))
    }
}
