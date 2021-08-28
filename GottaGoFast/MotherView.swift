//
//  MotherView.swift
//  GottaGoFast
//
//  Created by Erik Luu on 7/23/21.
//

import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            HomeView(viewRouter: viewRouter)
        case .page2:
            RunningView(viewRouter: viewRouter)
        case .page3:
            EntryView()
        case .page4:
            SettingsView()
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
