//
//  CafesDetailRow.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/08/21.
//

import SwiftUI

struct CafesDetailRow: View {
    
    @ObservedObject var cafe: CafeEntity
    let bounds = UIScreen.main.bounds
    
    var body: some View {
        HStack() {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75, alignment: .leading)
                .clipped()
                .padding()
            if cafe.image1?.count ?? 0 != 0 {
                Image(uiImage: UIImage(data: cafe.image1!) ?? UIImage(systemName: "photo")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75, alignment: .leading)
                    .clipped()
                    .padding()
            }
            Spacer()
            VStack(alignment: .center) {
                Text(self.cafe.name ?? "no Title")
                    .padding(30)
            }
        }
        .frame(width: bounds.width / 1.1,height: 100)
        .background(Color.baseColor1)
        .cornerRadius(20)
            
    }
}

struct CafesDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        let container = PersistenceController.shared.container
        let context = container.viewContext
        
        let newCafe = CafeEntity(context: context)
        newCafe.name = "702カフェ"
        
        return VStack(alignment: .leading) {
            VStack {
                CafesDetailRow(cafe: newCafe)
            }.environment(\.managedObjectContext, context)
        }
    }
}
