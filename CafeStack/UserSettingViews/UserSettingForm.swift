//
//  UserSettingForm.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/07/25.
//

import SwiftUI

struct UserSettingForm: View {
    
    @State var userName: String = ""
    @State var date = Date()
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color.baseColor1.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    Text("Hello!")
                        .padding()
                        .foregroundColor(.baseColor3)
                        .font(.largeTitle)
                        .fontWeight(.ultraLight)
                    
                    Image("UserSettingIcon")
                        .resizable() //サイズ変更
                        .scaledToFit() //画像の比率を指定
                        .foregroundColor(.baseColor3)
                        .padding(15.0)
                        .frame(width: 110,height: 110)
                        .cornerRadius(100) //画像の角を削る
                        .padding(.bottom , 50)
                
                    VStack {
                        TextField("プロフィール名", text: $userName)
                            .padding()
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 250,maxHeight: 40)
                            .background {
                                Color.white
                                Rectangle()
                                .stroke(lineWidth: 2)
                            }
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2.0)
                            )
                            .padding()
                           
                        
                        Button(action: {
                            isPresented = true
                        }) {
                            Text("アプリを始める")
                                .fontWeight(.semibold)
                                .frame(width: 250, height: 48)
                                .foregroundColor(Color.baseColor3)
                                .background(Color.baseColor2)
                                .cornerRadius(18)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(Color.white, lineWidth: 1.0)
                                )
                                .padding(.bottom, 50)
                        }.fullScreenCover(isPresented: $isPresented) { //フルスクリーンの画面遷移
                            MainContent()
                        }
                    }
                }
            }
        }
    }
}

struct UserSettingForm_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingForm()
    }
}
