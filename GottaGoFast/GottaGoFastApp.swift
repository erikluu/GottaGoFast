//
//  GottaGoFastApp.swift
//  GottaGoFast
//
//  Created by Erik Luu on 7/20/21.
//

import SwiftUI
@main
struct GottaGoFastApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
        }
    }
}
