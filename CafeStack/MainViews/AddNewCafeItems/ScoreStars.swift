//
//  ScoreStars.swift
//  CafeStack
//
//  Created by 村上太一 on 2023/08/02.
//

import SwiftUI

struct ScoreStars: View {
    @Binding var score: Double
    var body: some View {
        switch score{
        case 0.5:
            HStack {
                Image(systemName: "star.leadinghalf.filled")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        case 1.0:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        case 1.5:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.leadinghalf.filled")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        case 2.0:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        case 2.5:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.leadinghalf.filled")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        case 3.0:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        case 3.5:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.leadinghalf.filled")
                Image(systemName: "star")
            }
        case 4.0:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
        case 4.5:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.leadinghalf.filled")
            }
        case 5.0:
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
            }
        default:
            HStack {
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }
        }
    }
}

struct ScoreStars_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ScoreStars(score: .constant(0.5))
            ScoreStars(score: .constant(1.0))
            ScoreStars(score: .constant(1.5))
            ScoreStars(score: .constant(2.0))
            ScoreStars(score: .constant(2.5))
            ScoreStars(score: .constant(3.0))
            ScoreStars(score: .constant(3.5))
            ScoreStars(score: .constant(4.0))
            ScoreStars(score: .constant(4.5))
            ScoreStars(score: .constant(5.0))
        }
        
    }
}
