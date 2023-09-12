//
//  abcc.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/12.
//

import SwiftUI

struct DateAndCloseTable: View {
    let containerData: [CommonAttributes]
    let heading: String
    let verticalSpacing: CGFloat = 0
    let frameWidth: CGFloat = 100
    let frameHeight: CGFloat = 25
    let horizontalSpacing: CGFloat = 0
    let trailingPadding: CGFloat = 45
    let bottomPadding: CGFloat = -2
    let columns = [
        GridItem(.fixed(75), spacing: 0),
        GridItem(.fixed(75), spacing: 0)
    ]
    var body: some View {
        Text("")
        Text(heading)
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(.blue)
            .padding(.trailing, 24)
        Text("")
        ScrollView {
            let lastRowIndex: Int = containerData.count - 1
            LazyVGrid(columns: columns, alignment: .center, spacing: verticalSpacing){
                ForEach((0...lastRowIndex), id: \.self) { index in
                    let theDate = dateToStringFormatter.string(from: containerData[index].date!)
                    let theClose = String(format: "$%.2f", containerData[index].close )
                    Text(theDate)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .frame(width: frameWidth, height: frameHeight, alignment: .center)
                        .background(.white)
                        .border(.black, width: 1)
                        .padding(.trailing, trailingPadding)
                        .padding(.bottom, bottomPadding)
                    Text(theClose)
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .frame(width: frameWidth, height: frameHeight, alignment: .center)
                        .background(.white)
                        .border(.black, width: 1)
                        .padding(.bottom, bottomPadding)
                }
                Text("")
                Text("")
                Text("")
            } // end lazy v grid
            .padding(.horizontal)
        } // end of scroll view
    }
}



struct abcc_Previews: PreviewProvider {
    static var previews: some View {
        DateAndCloseTable()
    }
}
