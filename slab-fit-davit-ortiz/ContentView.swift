//
//  ContentView.swift
//  slab-fit-davit-ortiz
//
//  Created by edgar david ortiz diaz on 10/02/21.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseFirestore

class ProjectsViewModel: ObservableObject {
    @Published var projects = [Project]()
    func fetchData() {
        FirebaseApp.configure()
        let fireDb = Firestore.firestore()
        fireDb.collection("Projects").addSnapshotListener {[self]  (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.projects = documents.map{queryDocumentSnapshot -> Project in
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
        }
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/, content: {
                GridView()
            })
        }.navigationBarTitle("Heatmap")
    }
    struct ValuesChart: View {
        var body: some View {
            HStack {
                ForEach(1..<6) { columnNumber in
                    VStack {
                        ForEach(1..<Int(3)) { rowNumber in
                            HStack {
                                Rectangle()
                                    .fill(Color.random())
                                    .frame(
                                        width: 10,
                                        height: 10,
                                        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Text("+\(columnNumber * rowNumber)")
                                    .font(.footnote)
                            }
                        }
                    }
                }
            }.padding(.all, 12.0).border(Color.black, width: 1)
        }
    }
    struct GridView: View {
        @ObservedObject var projectsAllData = ProjectsViewModel()
        var gridColumns = CGFloat(7)
        var gridRows = CGFloat(14)
        var heatMapSize: CGSize {
            CGSize(width: ((UIScreen.screenWidth - 100) / gridColumns), height: 40)
        }
        var projectsData = testData
        let columnNames = ["Ejecución de Presupuesto", "Número de Operarios", "MW Generados", "Ingresos por MW", "Ejecución", "Facturación"]
        var body: some View {
            VStack {
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
                                    width: heatMapSize.width,
                                    height: 150)
                                .rotationEffect(.degrees(-90))
                                
                        }
                    }
                }
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

                                        
                                        
                                        Rectangle().fill(Color.random())
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
                ValuesChart()
            }.onAppear {
                projectsAllData.fetchData()
            }
        }
        func getRowArray(columnNames: [String], properties: [[String: Any]]) -> [Float?] {
            var returnArray = [Float?]()
            for index in 0..<columnNames.count {
                var found = false
                for prop in properties {
                    if prop["name"] as? String == columnNames[index],
                       let value = prop["progress"] as? NSNumber
                       {
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
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension Color {
    static func random() -> Color {
        return Color(UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
        )
    }
}
