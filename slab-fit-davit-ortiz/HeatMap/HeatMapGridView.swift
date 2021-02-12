//
//  HeatMapGridView.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import SwiftUI
struct HeatMapGridView: View {
    @ObservedObject var projectsAllData = ProjectsModel()
    var gridColumns = CGFloat(7)
    var heatMapSize: CGSize {
        CGSize(width: ((UIScreen.screenWidth - 100) / gridColumns), height: 40)
    }
    var projectsData = HeatMapIntyeractor.mockData
    let columnNames = ["Ejecución de Presupuesto",
                       "Número de Operarios",
                       "MW Generados",
                       "Ingresos por MW",
                       "Ejecución",
                       "Facturación"]
    var body: some View {
        VStack {
            ColumnLabels(columnNames: columnNames, width: heatMapSize.width)
            if projectsAllData.projects.count > 0 {
                ForEach(0..<projectsAllData.projects.count) {index in
                    HStack {
                        VStack(spacing: 0.0) {
                            HStack(spacing: 0.0) {
                                Text(projectsAllData.projects[index].name).font(.footnote).frame(
                                    width: 100,
                                    height: heatMapSize.height)
                                let array = getRowArray(columnNames: columnNames, properties: projectsAllData.projects[index].projectProperties)
                                ForEach(0..<projectsAllData.projects[index].projectProperties.count) {_ in
//TODO: here I am
                                    Rectangle().fill(Color("0"))
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
            }
            TableOfValues()
        }.onAppear {
            projectsAllData.fetchData()
        }
    }
    /// This method returns an array with the values for each column.
    /// Elements in the array can be nil if the property doesn't applies to the project
    /// - Parameters:
    ///   - columnNames: Array with the name of each column
    ///   - properties: The project properties array od dictionaries
    /// - Returns: This method returns an array of Project ojjects
    func getRowArray(columnNames: [String], properties: [[String: Any]]) -> [Float?] {
        var returnArray = [Float?]()
        for index in 0..<columnNames.count {
            var found = false
            for prop in properties {
                if prop["name"] as? String == columnNames[index],
                   let value = prop["progress"] as? NSNumber {
                    returnArray.append(value as? Float)
                    found = true
                    break
                }
            }
            if found == false {
                returnArray.append(nil)
            }
        }
        return returnArray
    }
}

/// Shows the first row with the  name of each column rotated -90 degrees
struct ColumnLabels: View {
    var columnNames: [String]
    var width: CGFloat
    var body: some View {
        HStack(spacing: 0.0) {
            Spacer().frame(
                width: 100,
                height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
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
                            height: 150)
                        .rotationEffect(.degrees(-90))
                }
            }
        }
    }
}
