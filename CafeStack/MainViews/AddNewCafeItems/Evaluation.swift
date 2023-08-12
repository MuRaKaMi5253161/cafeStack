//
//  EvaluationStars.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/08/02.
//

import SwiftUI

struct Evalution: View {
    @State private var scoreValue = 0.0
    @State private var isEditing = false
    @State var halfStarCount = 0
    
    fileprivate func ExistHalfStar() {
        self.halfStarCount = 1
    }
    
    var body: some View {
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
                }.frame(width: 300)
        }
    }
}

struct Evaluation_Previews: PreviewProvider {
    static var previews: some View {
        Evalution()
    }
}
