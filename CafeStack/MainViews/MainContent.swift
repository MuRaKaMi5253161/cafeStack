//
//  MainContent.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/26.
//

import SwiftUI

struct MainContent: View {
    var body: some View {
        VStack {
            UserLine()
            UnderMenuLine()
        }.background(Color.baseColor1)
    }
}

struct MainContent_Previews: PreviewProvider {
    static var previews: some View {
        MainContent()
    }
}
