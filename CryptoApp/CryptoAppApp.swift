//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Shaik Ahron on 29/01/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
