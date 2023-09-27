//
//  AccountTransferView.swift
//  NikeShoes
//
//  Created by Chloe Chung on 2023/09/14.
//

import SwiftUI

struct AccountTransferView: View {
    var finalPrice: String
    @Binding var isPresented: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("받는 사람")
                        .bold()
                    Spacer()
                    Text("나이키")
                }
                .padding()

                HStack {
                    Text("계좌 번호")
                        .bold()
                    Spacer()
                    Text("123-456-789")
                }
                .padding()

                HStack {
                    Text("입금 금액")
                        .bold()
                    Spacer()
                    Text("₩\(finalPrice)")
                }
                .padding()

                HStack {
                    Text("메모")
                        .bold()
                    Spacer()
                    Text("주문 번호: 123456789")
                }
                .padding()

                Spacer()

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("확인")
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("계좌이체 안내", displayMode: .inline)
        }
    }
}

struct AccountTransferView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTransferView(finalPrice: "30000", isPresented: .constant(true))
    }
}
