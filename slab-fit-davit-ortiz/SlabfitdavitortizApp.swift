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

struct Project: Identifiable {
    var id: String
    var name: String
    var projectProperties: Array<Dictionary<String, Any>>
   
}
let testData = [
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
