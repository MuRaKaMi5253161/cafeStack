//
//  CafeList.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/26.
//

import SwiftUI

struct Cafes: View {
        @State var numberOfTasks = 0
        @State var showList = false
        @State private var images: Data
        @ObservedObject var cafeEntityModel: CafeEntityModel
        @Environment(\.managedObjectContext) var viewContext
        
        
        var body: some View {
            // 画面の横幅を取得
            let bounds = UIScreen.main.bounds
            HStack() {
                
            }
            
            .frame(width: bounds.width / 1.05, height: bounds.height / 6)
            .foregroundColor(.white)
            .background(Color.baseColor2)
            .cornerRadius(20)
            .padding(.bottom, 3)
        }
}

struct Cafes_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
           
        }
    }
}
