//
//  FitHippoApp.swift
//  FitHippo
//
//  Created by BACS495 on 4/25/22.
//

import SwiftUI

@main
struct FitHippoApp: App {
    @StateObject var user = User()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(user)
        }
    }
}
