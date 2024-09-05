//
//  ContentView.swift
//  AEPSwiftUITestApp
//
//  Created by Pravin Prakash Kumar on 9/4/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PDFPage()
                .tabItem {
                    Label("PDF", systemImage: "doc.fill")
                }
            
            SouthwestPage()
                .tabItem {
                    Label("Airplane", systemImage: "airplane.departure")
                }
        }
        .accentColor(.yellow)
    }
}
