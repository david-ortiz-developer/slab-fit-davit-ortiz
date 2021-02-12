//
//  HeatMapInteractor.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import Foundation
import Firebase
class HeatMapIntyeractor {
    static var mockData: Projects { [
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ]),
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ]),
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ]),
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ]),
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ]),
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ]),
        Project(id: "7556", name: "Facturación", projectProperties:
                    [["Facturacion": 18.5],
                     ["Socialización": 18.5],
                     ["Impácto en la comunidad": 18.5],
                     ["Gastos": 18.5],
                     ["Ejecución": 18.5],
                     ["Satisfacción del cliente": 18.5],
                     ["Flexibilidad y escalabilidad": 18.5]
        ])
    ]
    }
    /// This method fetchs the data from Firebase or from mocked data
    /// - Parameters:
    ///   - mocking: If its true the mocked data will be returnned
    ///   - result: This escaped closure sends the async response
    func retrieveProjects(mocking: Bool, result: @escaping (Projects?) -> Void) {
        if mocking == true {
            result(HeatMapIntyeractor.mockData)
        } else {
            FirebaseApp.configure()
            let fireDb = Firestore.firestore()
            fireDb.collection("Projects").addSnapshotListener {(querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                let projects = documents.map{queryDocumentSnapshot -> Project in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? ""
                    var props = Array<Dictionary<String, Any>>()
                    var projectId = ""
                    if let uid = data["id"] as? String {
                        projectId = uid
                    }
                    if let properties = data["properties"] as? Array<Dictionary<String, Any>> {
                        props = properties
                        print("properties: \(properties)")
                    }
                    return Project(id: projectId, name: name, projectProperties: props)
                }
                result(projects)
            }
        }
    }
}
