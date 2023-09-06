import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        List {
            ForEach(SettingsViewModel.allCases, id: \.rawValue) { item in
                NavigationLink(destination: item.destinationView) {
                    HStack {
                        Text(item.title)
                            .font(.medium16)
                            .padding(.vertical)
                    }
                }
                .padding(.horizontal, 20)
                .listRowBackground(Color.clear)
                
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView()
        }
    }
}


