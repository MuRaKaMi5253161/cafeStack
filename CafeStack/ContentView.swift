//
//  ContentView.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    static let container = PersistenceController.shared.container
    let context = container.viewContext
    
    var body: some View {
        MainContent()
            .environment(\.managedObjectContext, context)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
