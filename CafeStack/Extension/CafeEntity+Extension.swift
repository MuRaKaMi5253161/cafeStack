//
//  CafeEntity+Extension.swift
//  CafeStack
//
//  Created by user.name on 2020/05/15.
//  Copyright © 2020 example.com. All rights reserved.
//

import CoreData
import SwiftUI

extension CafeEntity {
    
    static func create(in managedObjectContext: NSManagedObjectContext,
                       cafeName: String,
                       score: Double,
                       exp: String,
                       time: Date? = Date()){
        let cafe = self.init(context: managedObjectContext)
        cafe.date = time
        cafe.name = cafeName
        cafe.score = score
        cafe.exp = exp
        cafe.id = UUID().uuidString
        
        do {
            try  managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
