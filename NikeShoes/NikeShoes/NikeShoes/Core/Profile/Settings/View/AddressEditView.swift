import SwiftUI
import NikeShoesCore

struct AddressEditView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var addressViewModel: AddressViewModel
    
    let title: String
    let index: Int
    
    @State private var name: String
    @State private var city: String
    @State private var district: String
    @State private var town: String
    @State private var fullAddress: String
    @State private var postalCode: String
    @State private var phoneNumber: String
    @State private var country: String
    @State private var isDefault: Bool
    
    init(title: String, viewModel: AddressViewModel, index: Int) {
        let address = viewModel.addresses[index]
        self.title = title
        self.addressViewModel = viewModel
        self.index = index
        
        _name = State(initialValue: address.name)
        _city = State(initialValue: address.city)
        _district = State(initialValue: address.district)
        _town = State(initialValue: address.town)
        _fullAddress = State(initialValue: address.fullAddress)
        _postalCode = State(initialValue: address.postalCode)
        _phoneNumber = State(initialValue: address.phoneNumber)
        _country = State(initialValue: address.country)
        _isDefault = State(initialValue: address.isDefault)
    }
    
    var body: some View {
        ScrollView {
            Divider()
            
            // User Info
            VStack {
                AddressTextField(title: "이름", text: $name)
                AddressTextField(title: "City", text: $city)
                AddressTextField(title: "District", text: $district)
                AddressTextField(title: "Town", text: $town)
                AddressTextField(title: "fullAddress", text: $fullAddress)
                AddressTextField(title: "postalCode", text: $postalCode)
                AddressTextField(title: "phoneNumber", text: $phoneNumber)
                AddressTextField(title: "country", text: $country)
                
            }
            .padding(.top)
            
            Spacer()
            
            CustomButton(
                background: .black,
                foregroundColor: .white,
                title: "저장") {
                    // 배송지 업데이트
                    updateAddress()
                }
        }
        .modifier(NavigationNikeSetting(title: title))
    }
    
    func updateAddress() {
        let updatedAddress = AddressDTO(
            id: addressViewModel.addresses[index].id,
            name: name,
            city: city,
            district: district,
            town: town,
            fullAddress: fullAddress,
            postalCode: postalCode,
            phoneNumber: phoneNumber,
            country: country,
            isDefault: isDefault
        )
        
        addressViewModel.updateAddress(address: updatedAddress)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddressEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddressEditView(title: "배송지 수정", viewModel: AddressViewModel(), index: 0)
        }
    }
}

struct AddressTextField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        TextField(title, text: $text)
            .padding(15)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
            .padding(10)
    }
}
