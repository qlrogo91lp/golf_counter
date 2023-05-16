//
//  HoleScore.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/09.
//

import Foundation
import SwiftUI

struct HoleScoreView: View {
    var holeNum: Int
    @State var scoreDetail: ScoreDetail
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
                .overlay() {
                    Circle().stroke(.gray, lineWidth: 4)
                }
                .overlay() {
                    Text("\(holeNum)")
                        .foregroundColor(.black)
                }
                .padding(.trailing)

            VStack {
                HStack {
                    Text("Par\(scoreDetail.maxHole)")
                        .foregroundColor(.blue)

                    Spacer()

                    if scoreDetail.shot + scoreDetail.putt == 0 {
                        Text("-")
                    } else {
                        if (scoreDetail.shot + scoreDetail.putt) - scoreDetail.maxHole <= 0 {
                            Text("\((scoreDetail.shot + scoreDetail.putt) - scoreDetail.maxHole)")
                                .foregroundColor(.green)
                        } else {
                            Text("+ \((scoreDetail.shot + scoreDetail.putt) - scoreDetail.maxHole)")
                                .foregroundColor(.orange)
                        }
                    }
                }

                HStack {
                    HStack {
                        Text("Shot:")
                        Text("\(scoreDetail.shot)")
                    }

                    Spacer()

                    HStack {
                        Text("Putt:")
                        Text("\(scoreDetail.putt)")
                    }
                }
            }
        }
    }
}

struct HoleScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HoleScoreView(holeNum: 3, scoreDetail: ScoreDetail())
    }
}
