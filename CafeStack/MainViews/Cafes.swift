//
//  CafeList.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/26.
//

import SwiftUI
import CoreData

struct Cafes: View {
    @State var numberOfTasks = 0
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CafeEntity.date,
                                           ascending: true)],
        animation: .default)
    var cafeList: FetchedResults<CafeEntity>
    let bounds = UIScreen.main.bounds
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(cafeList) { cafe in
                            CafesDetailRow(cafe: cafe)
                                .environment(\.managedObjectContext, self.viewContext)
                        }
                    }
                }
            }.frame(width: bounds.width)
                .background(Color.baseColor3)
        }
    }
}

struct Cafes_Previews: PreviewProvider {
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        
        // テストデータの全削除
        let request = NSBatchDeleteRequest(
            fetchRequest: NSFetchRequest(entityName: "CafeEntity"))
        try! container.persistentStoreCoordinator.execute(request,
                                                          with: context)
        
        return Cafes()
            .environment(\.managedObjectContext, context)
    }
}

