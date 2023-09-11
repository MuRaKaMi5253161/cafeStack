//
//  MainContent.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/26.
//

import SwiftUI

struct MainContent: View {
    @Environment(\.managedObjectContext) var viewContext
    var body: some View {
        VStack {
            UserLine()
            Cafes()
                .environment(\.managedObjectContext, self.viewContext)
            UnderMenuLine()
        }
    }
}

struct MainContent_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        
        return MainContent()
            .environment(\.managedObjectContext, context)
    }
}
