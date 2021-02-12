//
//  HeatMapProtocol.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import SwiftUI
protocol HeatMapProtocol {
    var gridColumns:CGFloat {get}
    var heatMapBoxSize: CGSize {get}
    /// This method returns an array with the values for each column.
    /// Elements in the array can be nil if the property doesn't applies to the project
    /// - Parameters:
    ///   - columnNames: Array with the name of each column
    ///   - properties: The project properties array od dictionaries
    /// - Returns: This method returns an array of Project ojjects
    func getRowArray(columnNames: [String], properties: [[String: Any]]) -> [Float?]
}
