//
//  ProjectsModel.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import Foundation
import Firebase
struct Project: Identifiable {
    var id: String
    var name: String
    var projectProperties: Array<Dictionary<String, Any>>
}
typealias Projects = [Project]
class ProjectsModel: ObservableObject {
    @Published var projects = Projects()
    func fetchData() {
        let interactor = HeatMapInteractor()
        interactor.retrieveProjects(mocking: false) {projectsReturnned in
            if let projectsArray = projectsReturnned {
                self.projects = projectsArray
            }
        }
    }
}
