//
//  ScoreDetail.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/12.
//

import Foundation

class ScoreDetail: ObservableObject{
    @Published var maxHole: Int = 3
    @Published var shot: Int = 0
    @Published var putt: Int = 0
}
