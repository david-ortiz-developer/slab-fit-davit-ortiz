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


struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/, content: {
                HeatMapGridView()
            })
        }.navigationBarTitle("Heatmap")
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
