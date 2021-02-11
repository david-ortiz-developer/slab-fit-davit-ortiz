//
//  ContentView.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 10/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/, content: {
            GridView()
        })
    }
    struct ValuesChart: View {
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
    struct GridView: View {
        var gridColumns = CGFloat(7)
        var gridRows = CGFloat(14)
        var heatMapSize: CGSize {
            CGSize(width: ((UIScreen.screenWidth - 100) / gridColumns), height: 40)
        }
        var body: some View {
            VStack {
                HStack(spacing: 0.0) {
                    Spacer().frame(
                        width: 100,
                        height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    ForEach(1..<Int(gridColumns)) { _ in
                        Group {
                            Text("Resumen y otros")
                                .font(.footnote)
                                .lineLimit(0)
                                .rotationEffect(.degrees(-90))
                                .fixedSize()
                                .frame(
                                    width: heatMapSize.width,
                                    height: 120)
                        }
                    }
                }
                HStack {
                    VStack {
                        ForEach(1..<Int(gridRows)) { _ in
                            Text("Adquisición de planta en Chile").font(.footnote).frame(
                                width: 100,
                                height: heatMapSize.height)
                        }
                    }
                    VStack(spacing: 0.0) {
                        ForEach(1..<Int(gridRows)) { _ in
                            HStack(spacing: 0.0) {
                                ForEach(1..<Int(gridColumns)) {_ in
                                    Rectangle().fill(Color.random())
                                        .padding(.horizontal, 0.0)
                                        .frame(
                                            width: heatMapSize.width,
                                            height: heatMapSize.height)
                                        .border(Color.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                }
                            }
                        }
                    }
                }
                ValuesChart()
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension Color {
    static func random() -> Color {
        return Color(UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
        )
    }
}
