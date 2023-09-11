//
//  UnderMenuLine.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/27.
//

import SwiftUI

struct UnderMenuLine: View {
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        // 画面の横幅を取得
        let bounds = UIScreen.main.bounds
        
        HStack(spacing: 0) {
            Image(systemName: "list.bullet")
                .resizable() //サイズ変更
                .scaledToFit() //画像の比率を指定
                .foregroundColor(.white) //画像の色を指定
                .padding(.leading, bounds.width / 30) //画像に余白が追加される
                .frame(maxWidth: bounds.width / 4, minHeight: 30) // 画像のサイズ
                .padding()
            Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                .resizable() //サイズ変更
                .scaledToFit() //画像の比率を指定
                .foregroundColor(.white) //画像の色を指定
                .padding(.leading, bounds.width / 30)
                .frame(maxWidth: bounds.width / 4, minHeight: 30)
                .padding()
                .onTapGesture {
                    self.showList = true
                }
                .sheet(isPresented: $showList) {
//                    AddNewCafe(CafeEntityModel: Model_cafeEntity()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//                        .environment(\.managedObjectContext, self.viewContext)
                    AddNewCafe()
                        .environment(\.managedObjectContext, self.viewContext)
                }
            Image(systemName
                  : "square.and.at.rectangle.fill")
            .resizable() //サイズ変更
            .scaledToFit() //画像の比率を指定
            .foregroundColor(.white) //画像の色を指定
            .padding(.leading, bounds.width / 30)
            .frame(maxWidth: bounds.width / 4, minHeight: 30)
            .padding()
            Image(systemName: "gearshape.fill")
                .resizable() //サイズ変更
                .scaledToFit() //画像の比率を指定
                .foregroundColor(.white) //画像の色を指定
                .padding(.leading, bounds.width / 30)
                .frame(maxWidth: bounds.width / 4, minHeight: 30)
                .padding()
            Spacer()
        }
        .frame(width: bounds.width, height: 60)
        .padding()
        .background(Color.baseColor2)
        
    }
}

struct UnderMenuLine_Previews: PreviewProvider {
    static var previews: some View {
        UnderMenuLine()
    }
}
