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
        VStack(spacing: 0.0) {
            ForEach(0..<11) { columnNumber in
                HStack(spacing: 0.0)  {
                            Rectangle()
                                .fill(Color(String(columnNumber)))
                                .frame(
                                    width: 40,
                                    height: 20,
                                    alignment: .center)
                            Text("\(columnNumber)0%")
                                .font(.footnote)
                                .frame(width: 70, height: 20, alignment: .center)
                        }
            }
        }.padding(.all, 12.0).border(Color.black, width: 1)
    }
}
