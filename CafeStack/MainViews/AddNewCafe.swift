//
//  AddNewCafe.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/08/02.
//

import SwiftUI
import PhotosUI

struct AddNewCafe: View {
    @ObservedObject var cafeEntityModel : CafeEntityModel
    @State var cafeName: String = ""
    @State var exp: String = ""
    @State var isOn = false
    @State private var scoreValue = 0.0
    @State private var isEditing = false
    @State var halfStarCount = 0
    // Date? nilが入ってもOK
    @State var time: Date? = Date()
    
    //カメラロールを開閉スイッチにするBool値
    @State private var isPicking: Bool = false
    //選択した写真を入れる配列
    @State private var images: [Data] = []
    //PHPickerの設定
    var pickerConfig: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images//静止画写真のみ選択
        config.preferredAssetRepresentationMode = .current
        config.selectionLimit = 2//選択する枚数の上限
        // ちなみにios15以降なら選択する順番も付けられる
        //config.selection = .ordered
        return config
    }
    
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    fileprivate func save() {
        do {
            try  self.viewContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    fileprivate func ExistHalfStar() {
        self.halfStarCount = 1
    }
    
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        NavigationView {
            Form {
                VStack(alignment: .center) {
                    Button(action: {self.isPicking.toggle()}){
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(.blue)
                    }
                    .fullScreenCover(isPresented: $isPicking){ImagePicker(
                        configuration: pickerConfig,
                        completion: {result in },
                        isPicking: $isPicking,
                        images: $images)
                    }
                    Text("画像を追加")
                        .foregroundColor(.blue)
                    
                }
                .frame(width: bounds.width)
                .listRowSeparator(.hidden)
                
                switch images.count {
                    //1枚の場合
                case 1:
                    HStack {
                        Image(uiImage: UIImage(data: images[0]) ?? UIImage(systemName: "photo")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height:150, alignment: .center)
                            .border(Color.gray)
                            .clipped()
                        Spacer()
                    }
                    //選択した画像が表示された時点でCoreDataモデルに代入する
                    .onAppear(){
                        cafeEntityModel.image1 = images[0]
                        cafeEntityModel.image2 = Data.init()
                    }
                    //2枚の場合
                case 2:
                    HStack{
                        Image(uiImage: UIImage(data: images[0]) ?? UIImage(systemName: "photo")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150, alignment: .center)
                            .border(Color.gray)
                            .clipped()
                        Image(uiImage: UIImage(data: images[1]) ?? UIImage(systemName: "photo")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150, alignment: .center)
                            .border(Color.gray)
                            .clipped()
                        Spacer()
                    }.onAppear(){
                        cafeEntityModel.image1 = images[0]
                        cafeEntityModel.image2 = images[1]
                    }
                    //0枚の場合か,編集で開いたシートの場合
                default:
                    VStack(alignment: .center) {
                        Text("画像がありません")
                            .foregroundColor(.secondary)
                            .padding()
                    }.frame(width: bounds.width)
                }
                Section(header: Text("カフェ名").foregroundColor(.secondary)) {
                    TextField("カフェ名を入力", text: $cafeName)
                }.foregroundColor(.black)
                Section(header: Text("評価").foregroundColor(.secondary)) {
                    VStack {
                        ScoreStars(score: .constant(scoreValue))
                        Slider(
                            value: $scoreValue,
                            in: 0...5.0,
                            step: 0.5
                        ) {
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("5.0")
                        } onEditingChanged: { editing in
                            isEditing = editing
                        }
                    }
                }.foregroundColor(.blue)
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())){Text("オプション").foregroundColor(.secondary)}) {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: { Text("日付").foregroundColor(.secondary) })
                        TextField("説明", text: $exp ,axis: .vertical)
                            .frame(height: 50)
                    } else {
                        Text("オプション未設定").foregroundColor(.secondary)
                    }
                }
                Section(header: Text("操作")) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack(alignment: .center) {
                            Image(systemName: "minus.circle.fill")
                            Text("キャンセル")
                        }.foregroundColor(.red)
                    }
                }
                
            }.navigationTitle("カフェを追加")
                .navigationBarItems(trailing: Button(action: {
                    /// タスク新規登録処理
                    let newCafe = CafeEntity(context: viewContext)
                    newCafe.date = time
                    newCafe.name = cafeName
                    newCafe.score = scoreValue
                    newCafe.exp = exp
                    
                    try? viewContext.save()
                    
                    /// 現在のViewを閉じる
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("保存")
                })
        }
    }
}

struct AddNewCafe_Previews: PreviewProvider {
    static var previews: some View {
        AddNewCafe(cafeEntityModel: CafeEntityModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
