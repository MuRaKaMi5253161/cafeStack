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
                                           ascending: false)],
        animation: .default)
    var cafeList: FetchedResults<CafeEntity>
    let bounds = UIScreen.main.bounds

    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if(cafeList != nil) {
                        Text("カフェを登録しよう")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .foregroundColor(Color.baseColor1)
                            
                    } else {
                        List {
                            ForEach(cafeList) { cafe in
                                CafesDetailRow(cafe: cafe)
                                    .environment(\.managedObjectContext, self.viewContext)
                            }.listRowSeparator(.hidden)
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.white)
                        .listStyle(PlainListStyle())
                    }
                }
            }
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
        
        // データを追加
//        CafeEntity.create(in: context,
//                          cafeName : "カフェプロジェクト", score: 3.5, exp: "String")
        
        return Cafes()
            .environment(\.managedObjectContext, context)
    }
}

