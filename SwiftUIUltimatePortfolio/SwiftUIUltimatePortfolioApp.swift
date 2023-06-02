//
//  SwiftUIUltimatePortfolioApp.swift
//  SwiftUIUltimatePortfolio
//
//  Created by Noora Maeda on 2023/06/01.
//

import SwiftUI

@main
struct SwiftUIUltimatePortfolioApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
        }
    }
}
