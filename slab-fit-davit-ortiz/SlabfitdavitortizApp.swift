//
//  slab_fit_davit_ortizApp.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 10/02/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct SlabfitdavitortizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class HeatMapViewModel: ObservableObject {
    @Published var projects = [Project]()
}
struct ProjectProperty {
    var name: String
    var progress: Float
}
struct Project: Identifiable {
    var id: String
    var name: String
    var projectProperties: [ProjectProperty]
   
}
let testData = [
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    ),
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    ),
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    ),
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    ),
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    ),
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    ),
    Project(id: "7556", name: "Facturación", projectProperties:
                [ProjectProperty(name: "Facturacion", progress: 18.5),
                 ProjectProperty(name: "Socialización", progress: 18.5),
                 ProjectProperty(name: "Impácto en la comunidad", progress: 18.5),
                 ProjectProperty(name: "Gastos", progress: 18.5),
                 ProjectProperty(name: "Ejecución", progress: 18.5),
                 ProjectProperty(name: "Satisfacción del cliente", progress: 18.5),
                 ProjectProperty(name: "Flexibilidad y escalabilidad", progress: 18.5)]
    )
]

