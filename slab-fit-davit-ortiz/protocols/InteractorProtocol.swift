//
//  InteractorProtocol.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import Foundation
protocol InteractorProtocol {
    /// This method fetchs the data from Firebase or from mocked data
    /// - Parameters:
    ///   - mocking: If its true the mocked data will be returnned
    ///   - result: This escaped closure sends the async response
    func retrieveProjects(mocking: Bool, result: @escaping (Projects?) -> Void)
}
