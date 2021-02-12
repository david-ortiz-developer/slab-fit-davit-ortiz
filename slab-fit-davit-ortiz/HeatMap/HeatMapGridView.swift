//
//  HeatMapGridView.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import SwiftUI
struct HeatMapGridView: View, HeatMapProtocol {
    @ObservedObject var projectsAllData = ProjectsModel()
    var gridColumns = CGFloat(7)
    var heatMapBoxSize: CGSize {
        CGSize(width: ((UIScreen.screenWidth - Constants.leadingMargin) / gridColumns), height: 40)
    }
   
    var body: some View {
        HStack {
            Text("hello world")
        }
        
        VStack {
            ColumnLabels(columnNames: Constants.columnNames, width: heatMapBoxSize.width)
            if projectsAllData.projects.count > 0 {
                ForEach(0..<projectsAllData.projects.count) {index in
                    HStack {
                        VStack(spacing: 0.0) {
                            HStack(spacing: 0.0) {
                                Text(projectsAllData.projects[index].name).font(.footnote).frame(
                                    width: 100,
                                    height: heatMapBoxSize.height)
                                let columnValuesArray: [Float?] = getRowArray(columnNames: Constants.columnNames, properties: projectsAllData.projects[index].projectProperties)
                                ForEach(0..<columnValuesArray.count) {indexColumn in
                                    if let valueObtained = columnValuesArray[indexColumn] {
                                        Rectangle().fill(Color(String(10)))
                                            .padding(.horizontal, 0.0)
                                            .frame(
                                                width: heatMapBoxSize.width,
                                                height: heatMapBoxSize.height)
                                            .border(Color.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                    } else {
                                        Spacer()
                                            .frame(width: heatMapBoxSize.width, height: heatMapBoxSize.height, alignment: .center)
                                    }
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
                if prop[Constants.snapShotKeyName] as? String == columnNames[index],
                   let value = prop[Constants.snapShotKeyNumber] as? NSNumber {
                    //returnArray.append(Int.random(in: 0..<11))
                    returnArray.append(Float(value))
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
    func getHeatColorFor(indexColumn: Int, value: Float) {
        let goalsTupple = Constants.goals
        
    }
}
