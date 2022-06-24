//
//  swiftui_core_dataApp.swift
//  swiftui-core-data
//
//  Created by Ali Eren Çelebi on 25.06.2022.
//

import SwiftUI

@main
struct swiftui_core_dataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
