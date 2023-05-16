//
//  ScoreSetupView.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/12.
//

import SwiftUI

struct ScoreSetupView: View {
    @EnvironmentObject var scoreDetail: ScoreDetail
    
    var body: some View {
        VStack {
            HStack {
                Text("Par \(scoreDetail.maxHole)")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                Spacer()
            }.padding(.leading)
                
            VStack {
                HoleScoreCounterView(type: "Shot").padding(.horizontal)
                HoleScoreCounterView(type: "Putt").padding(.horizontal)
            }
        }
    }
}

struct ScoreSetupView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSetupView().environmentObject(ScoreDetail())
    }
}
