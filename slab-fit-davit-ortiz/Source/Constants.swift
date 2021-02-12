//
//  Constants.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 12/02/21.
//

import SwiftUI
 struct Constants {
    static let goals = [(min: 0, max: 100),
                 (min: 1, max:300),
                 (min: 200, max: 1800),
                 (min: 0.12, max: 2.0),
                 (min: 0, max: 100),
                 (min: 0, max: 100),
                 
    ]
    static let gridColumnLabelsHeight: CGFloat = 170
    static let columnLabelsWidh: CGFloat = 100
    static let columnLabelsHeight: CGFloat = 100
    static let leadingMargin: CGFloat = 100
    static  let columnNames = ["Ejecución de Presupuesto",
                               "Número de Operarios",
                               "MW Generados",
                               "Ingresos por MW",
                               "Ejecución",
                               "Facturación"]
    static let valuesColumns = 3
    static let snapShotKeyName = "name"
    static let snapShotKeyNumber = "progress"
    static let snapShotKeyProperties = "properties"
    static let dbCollectionName = "Projects"
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
}
