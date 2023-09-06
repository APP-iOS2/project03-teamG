import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            ForEach(SettingsViewModel.allCases, id: \.rawValue) { item in
                NavigationLink(destination: item.destinationView) {
                    HStack {
                        Text(item.title)
                    }
                    .padding()
                }
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle("설정", displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView()
        }
    }
}


