//
//  TableOfValues.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import SwiftUI
/// This is the table with the explanation for each colors - values below the heatmap
struct TableOfValues: View {
    var body: some View {
        HStack {
            ForEach(1..<6) { columnNumber in
                VStack {
                    ForEach(1..<Int(3)) { rowNumber in
                        HStack {
                            Rectangle()
                                .fill(Color.random())
                                .frame(
                                    width: 10,
                                    height: 10,
                                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text("+\(columnNumber * rowNumber)")
                                .font(.footnote)
                        }
                    }
                }
            }
        }.padding(.all, 12.0).border(Color.black, width: 1)
    }
}
