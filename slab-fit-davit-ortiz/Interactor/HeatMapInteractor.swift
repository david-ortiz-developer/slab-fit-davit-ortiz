//
//  HeatMapInteractor.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import Foundation
import Firebase
class HeatMapInteractor: InteractorProtocol {
    /// This method fetchs the data from Firebase or from mocked data
    /// - Parameters:
    ///   - mocking: If its true the mocked data will be returnned
    ///   - result: This escaped closure sends the async response
    func retrieveProjects(mocking: Bool, result: @escaping (Projects?) -> Void) {
        if mocking == true {
            result(Constants.mockData)
        } else {
            FirebaseApp.configure()
            let fireDb = Firestore.firestore()
            fireDb.collection(Constants.dbCollectionName).addSnapshotListener {(querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                let projects = documents.map{queryDocumentSnapshot -> Project in
                    let data = queryDocumentSnapshot.data()
                    let name = data[Constants.snapShotKeyName] as? String ?? ""
                    var props = Array<Dictionary<String, Any>>()
                    var projectId = ""
                    if let uid = data["id"] as? String {
                        projectId = uid
                    }
                    if let properties = data[Constants.snapShotKeyProperties] as? Array<Dictionary<String, Any>> {
                        props = properties
                    }
                    return Project(id: projectId, name: name, projectProperties: props)
                }
                result(projects)
            }
        }
    }
}
