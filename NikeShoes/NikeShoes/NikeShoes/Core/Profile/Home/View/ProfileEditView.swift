//
//  ProfileEditView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/08.
//

import SwiftUI
import PhotosUI

struct ProfileEditView: View {
    @ObservedObject var userProfileEditViewModel: UserProfileEditViewModel
    @Binding var isProfileEditClicked: Bool
    @State private var firstName: String = "이름 없음"
    @State private var lastName: String = "이름 없음"
    @State private var activityArea: String = "거주지/도시"
    @State private var introContent: String = "자기소개 없음"

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
                    userProfileEditViewModel.updateUserData(firstName: firstName, lastName: lastName, activityArea: activityArea, introContent: introContent)
                    Task {
                        do {
                            try await userProfileEditViewModel.updateUserData()
                        } catch {
                            print(error)
                        }
                    }
                    isProfileEditClicked = false
                } label: {
                    Text("저장")
                }
                .tint(Color.textGray)
            }
            .padding(.horizontal, 8)
            
            PhotoPicker()
            
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
                    TextField("거주지/도시", text: $activityArea)
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
        .onAppear{
            firstName = userProfileEditViewModel.userData?.firstName ?? "이름값 없음"
            lastName = userProfileEditViewModel.userData?.lastName ?? "이름값 없음"
            activityArea = userProfileEditViewModel.userData?.activityArea ?? "활동지역 없음"
            introContent = userProfileEditViewModel.userData?.introContent ?? "자기소개 없음"
        }
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView(userProfileEditViewModel: UserProfileEditViewModel(), isProfileEditClicked: .constant(true))
    }
}

struct PhotoPicker: View {
//    @AppStorage("selectedImageString") var selectedImageString: String = "camera.circle.fill"
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image = Image(systemName: "camera.circle.fill")
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) {
            VStack {
                selectedImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 150, height: 150)
                Text("수정")
            }
        }
        .task {
            imageLoadToFileManager()
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                newItem?.loadTransferable(type: Data.self, completionHandler: { result in
                    
                        switch result {
                        case .success(let success):
                            if let imageData = success,
                                let _ = UIImage(data: imageData) {
                                // 파일 경로를 설정
                                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                                let fileURL = documentsDirectory.appendingPathComponent("selected_image.jpg")
                                // 이미지 데이터를 파일로 저장
                                do {
                                    try imageData.write(to: fileURL)
                                } catch {
                                    print("Error saving image: \(error)")
                                }
                                // 저장된 이미지 데이터를 로드
                                if let loadedImageData = try? Data(contentsOf: fileURL),
                                   let loadedUIImage = UIImage(data: loadedImageData) {
                                    selectedImage = Image(uiImage: loadedUIImage)
                                }
                            } else {
                                selectedImage = Image(systemName: "camera.circle.fill")
                            }
                        case .failure(let error):
                            print(error)
                            selectedImage = Image(systemName: "camera.circle.fill")
                        }
                    
                })
            }
        }
        .controlSize(.large)
    }
    
    func imageLoadToFileManager() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent("selected_image.jpg")
        if let loadedImageData = try? Data(contentsOf: fileURL),
           let loadedUIImage = UIImage(data: loadedImageData) {
            selectedImage = Image(uiImage: loadedUIImage)
        }
    }
}
