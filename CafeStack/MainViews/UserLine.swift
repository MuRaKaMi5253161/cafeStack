//
//  MainUserLine.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/26.
//

import SwiftUI

struct UserLine: View {
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable().frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 30)
            
            Text("Taichi Murakami")
                .foregroundColor(Color.baseColor1)
            Spacer()
        }
        .padding() //上下左右に余白を開ける
        .background(Color.baseColor2)
    }
}

struct UserLine_Previews: PreviewProvider {
    static var previews: some View {
        UserLine()
    }
}
