import SwiftUI
import NikeShoesCore

struct ProfileView: View {
    @ObservedObject var userProfileEditViewModel: UserProfileEditViewModel = UserProfileEditViewModel()
    @State private var isProfileEditClicked = true
    @State private var selectedImage: Image = Image(systemName: "camera.circle.fill")
    @State private var firstName: String = "성"
    @State private var lastName: String = "이름"
    @State private var activityArea: String = "거주지/도시"
    
    var body: some View {
        NavigationStack {
            // MARK: HEADER
            VStack {
                headerView
                    .padding()
                actionButtonView
            }
            // MARK: CONTENT
            VStack {
                contentView
                Spacer()
            }
            .fullScreenCover(isPresented: $isProfileEditClicked) {
                ProfileEditView(userProfileEditViewModel: userProfileEditViewModel, isProfileEditClicked: $isProfileEditClicked)
            }
        }
        .onChange(of: isProfileEditClicked, perform: { _ in
            Task {
                imageLoadToFileManager()
                do {
                    try await userProfileEditViewModel.fetchUserData()
                } catch {
                    print(error)
                }
            }
        })
        .onAppear {
            isProfileEditClicked = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
                .environmentObject(FollowingViewModel())
        }
    }
}

extension ProfileView {
    var getUserName: String {
            return "\((userProfileEditViewModel.userData?.firstName ?? "성") + (userProfileEditViewModel.userData?.lastName ?? "이름"))"
    }
    var headerView: some View {
        VStack {
            // 프로필 이미지
            selectedImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .padding(.top, 50)
            
            // 이름
            Text("getUserName")
                .font(.mediumBold24)
                .padding(.top, 7)
                .padding(.bottom, 1)
            
            // 지역
            Text("\(userProfileEditViewModel.userData?.activityArea ?? "")")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 30)
            
            // Edit button
            VStack {
                Button {
                    isProfileEditClicked.toggle()
                } label: {
                    Text("프로필 수정")
                        .foregroundColor(.primary)
                }
                .buttonStyle(.borderless)
            }
            .frame(width: 200, height: 30)
            .border(.gray)
        }
    }
    
    var actionButtonView: some View {
        HStack {
            ForEach(ProfileViewModel.allCases, id: \.rawValue) { item in
                NavigationLink(destination: item.destinationView) {
                    VStack(alignment: .center) {
                        Image(systemName: item.imageName)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                            .opacity(0.75)
                        Text(item.title)
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(20)
                }
                Divider()
                    .frame(height: 30)
            }
        }
    }
    
    var contentView: some View {
        List {
            ProfileContentLabel(title: "수신함", subTitle: "메세지 보기", profileContentViewType: .inBoxView)
            ProfileContentLabel(title: "멤버 리워드", subTitle: "1개 사용 가능", profileContentViewType: .memberReward)
                .transition(.opacity)
            FollowingView(followingCount: 1)
        }
        .listStyle(.plain)
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
