//
//  CafeEntity.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/08/07.
//

import Foundation
import SwiftUI
import CoreData

class CafeEntityModel : ObservableObject{
    @Published var time = Date()
    @Published var cafeName: String = ""
    @Published var exp: String = ""
    @Published var image1: Data = Data.init()
    @Published var image2: Data = Data.init()
    @Published var scoreValue = 0.0

    @Published var isNewData = false
    @Published var updateItem : CafeEntity!
    
    @Environment(\.managedObjectContext) var viewContext
    
    func writeData(context :NSManagedObjectContext){
//データが新規か編集かで処理を分ける
        if updateItem != nil {
            
            updateItem.date = time
            updateItem.name = cafeName
            updateItem.score = scoreValue
            updateItem.image1 = image1
            updateItem.image2 = image2
            updateItem.exp = exp
            
            try! context.save()
            
            updateItem = nil
            isNewData.toggle()
            
            time = Date()
            image1 = Data.init()
            image2 = Data.init()
            cafeName = ""
            exp = ""
            scoreValue = 0.0
 
            return
        }
//データ新規作成
        let newCafe = CafeEntity(context: viewContext)
        newCafe.date = time
        newCafe.name = cafeName
        newCafe.score = scoreValue
        newCafe.exp = exp
        newCafe.image1 = image1
        newCafe.image2 = image2
        
        do{
            try? viewContext.save()
            
            isNewData.toggle()
            
            time = Date()
            image1 = Data.init()
            image2 = Data.init()
            cafeName = ""
            exp = ""
            scoreValue = 0.0
            
            
        }
        catch {
            print(error.localizedDescription)
            
        }
    }
}
