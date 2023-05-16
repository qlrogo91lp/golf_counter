//
//  ScoreListView.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/09.
//

import SwiftUI
import Foundation

struct ScoreListView: View {
    @State private var total: Int = 0
    @State private var details = ScoreArray()
    
    var body: some View {
        VStack {
            // MARK : 1~18홀까지 스코어 기록
            List {
                ForEach(1..<19) { num in
                    NavigationLink(destination: ScoreSetupView().environmentObject(details.detailArr[num-1])) {
                        HoleScoreView(holeNum: num, scoreDetail: details.detailArr[num-1])
                    }
                }
            }
            //.navigationTitle("Score List")
            .foregroundColor(.white)

            // TODO : 각 홀마다 편집이 완료되었을 때 업데이트
            Text("Total : \(total)")

            Button("done") {
                // TODO : DB에 저장
            }
        }
    }
}

struct ScoreListView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreListView()
    }
}
