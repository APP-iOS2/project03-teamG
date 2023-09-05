import SwiftUI

struct ProfileView: View {
    
    var imageUrl: URL = URL(string: "https://data1.pokemonkorea.co.kr/newdata/pokedex/full/000401.png")!
    
    var body: some View {
        NavigationStack{
            // header
            VStack {
                // User Info
                headerView
                    .padding()
                
                actionButtonView
                
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            // 프로필 이미지
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 72, height: 72)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 1.5))
                case .failure:
                    Text("Failed to load image.")
                @unknown default:
                    EmptyView()
                }
            }
            
            // 이름
            Text("파이리")
                .font(.headline)
                .padding(.top, 7)
                .padding(.bottom, 1)
            
            // 지역
            Text("태초마을")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 30)
            
            // Edit button
            Button {
                print("Edit Profile")
            } label: {
                Text("EDIT PROFILE")
                    .foregroundColor(.black)
            }
            .buttonStyle(.bordered)
            
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
                    .padding()
                }
                
                Divider()
                    .frame(height: 30)
            }
        }
    }
    
    
}