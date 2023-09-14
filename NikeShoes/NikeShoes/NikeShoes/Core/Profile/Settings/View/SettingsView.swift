import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        List {
            ForEach(SettingsViewModel.allCases, id: \.rawValue) { item in
                if item == .logOut {
                    Button(action: {
                        authViewModel.signOut()
                    }) {
                        Text(item.title)
                            .font(.medium16)
                            .padding(.vertical)
                            .foregroundColor(Color.nikeRed)
                            .padding(.horizontal, 20)
                    }
                    .listRowBackground(Color.clear)
                } else if item == .birth {
                    Button(action: {}) {
                        HStack {
                            Text(item.title)
                                .font(.medium16)
                                .padding(.vertical)
                                .foregroundColor(Color.black)
                                .padding(.horizontal, 20)
                            Spacer()
                            Text(authViewModel.userInfo.dateOfBirth)
                                .padding()
                        }
                    }
                    .listRowBackground(Color.clear)
                } else {
                    NavigationLink(destination: item.destinationView) {
                        HStack {
                            Text(item.title)
                                .font(.medium16)
                                .padding(.vertical)
                                .foregroundColor(item == .logOut ? Color.nikeRed : Color.black)
                        }
                    }
                    .padding(.horizontal, 20)
                    .listRowBackground(Color.clear)
                }
                
                if item == .birth ||
                    item == .location ||
                    item == .settingLocation ||
                    item == .signOut ||
                    item == .findShop {
                    Rectangle()
                        .fill(Color.lightGray)
                        .listRowSeparator(.hidden)
                }
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
        .modifier(NavigationNikeSetting(title: "설정"))
        .onAppear {
            authViewModel.fetchUser()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}
