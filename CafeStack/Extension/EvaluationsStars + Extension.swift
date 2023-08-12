//
//  TodoEntity+Extension.swift
//  Todo
//
//  Created by user.name on 2020/05/15.
//  Copyright © 2020 example.com. All rights reserved.
//

import CoreData
import SwiftUI

// extension TodoEntity: Identifiable{}
extension Evalution {
    enum Category: Int16 {
        case ImpUrg_1st     // Important & Urgent (第Ⅰ領域）
        case ImpNUrg_2nd    // Important & Not Urgent (第Ⅱ領域）
        case NImpUrg_3rd    // Not Important & Urgent（第Ⅲ領域）
        case NImpNUrg_4th   // Not Important & Not Urgent（第Ⅳ領域）
        
        func toString() -> String {
            switch self {
            case .ImpUrg_1st:
                return "重要かつ緊急"
            case .ImpNUrg_2nd:
                return "重要だが緊急ではない"
            case .NImpUrg_3rd:
                return "重要でないが緊急"
            case .NImpNUrg_4th:
                return "重要でも緊急でもない"
            }
        }
    }
}
