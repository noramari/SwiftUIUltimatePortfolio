//
//  SidebarViewToolbarView.swift
//  SwiftUIUltimatePortfolio
//
//  Created by Noora Maeda on 2023/06/05.
//

import SwiftUI

struct SidebarViewToolbarView: View {
    @EnvironmentObject var dataController: DataController
    @State private var showingAwards = false

    var body: some View {
        #if DEBUG
        Button {
            dataController.deleteAll()
            dataController.createSampleData()
        } label: {
            Label("ADD SAMPLES", systemImage: "flame")
        }
        #endif

        Button {
            showingAwards.toggle()
        } label: {
            Label("Show awards", systemImage: "rosette")
        }
        .sheet(isPresented: $showingAwards, content: AwardsView.init)

        Button(action: dataController.newTag) {
            Label("Add tag", systemImage: "plus.circle")
        }
    }
}

struct SidebarViewToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarViewToolbarView()
    }
}
