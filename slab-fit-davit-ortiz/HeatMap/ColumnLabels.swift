//
//  ColumnLabels.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import SwiftUI
/// Shows the first row with the  name of each column rotated -90 degrees
struct ColumnLabels: View {
    var columnNames: [String]
    var width: CGFloat
    var body: some View {
        HStack(spacing: 0.0) {
            Spacer().frame(
                width: Constants.columnLabelsWidh,
                height: Constants.columnLabelsHeight,
                alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ForEach(0..<columnNames.count) { index in
                Group {
                    Text(columnNames[index])
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                        .padding(.all, 12.0)
                        .fixedSize()
                        .frame(
                            width: width,
                            height: Constants.gridColumnLabelsHeight)
                        .rotationEffect(.degrees(-90))
                }
            }
        }
    }
}
