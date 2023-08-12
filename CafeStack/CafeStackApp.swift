//
//  CafeStackApp.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/25.
//

import SwiftUI

@main
struct CafeStackApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
