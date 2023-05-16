//
//  HoleScoreCounterView.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/12.
//

import SwiftUI

struct HoleScoreCounterView: View {
    var type: String
    @EnvironmentObject var scoreDetail: ScoreDetail

    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(type)").padding(.leading)
            
            HStack {
                Button(action: {
                    if self.scoreDetail.shot + self.scoreDetail.putt < self.scoreDetail.maxHole * 2 {
                        if type == "Shot" {
                            self.scoreDetail.shot += 1
                        } else {
                            self.scoreDetail.putt += 1
                        }
                    }
                    
                }, label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 35)
                        .overlay() {
                            Circle().stroke(.gray, lineWidth: 4)
                        }
                        .overlay() {
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                }).buttonStyle(.borderless).padding(.leading)
                
                Spacer()
                
                if type == "Shot" {
                    Text("\(self.scoreDetail.shot)")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(.green)
                } else {
                    Text("\(self.scoreDetail.putt)")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Button(action: {
                    print("shot : \(self.scoreDetail.shot), putt : \(self.scoreDetail.putt)")
                    
                    if type == "Shot" {
                        if self.scoreDetail.shot > 0 {
                            self.scoreDetail.shot -= 1
                        }
                    } else {
                        if self.scoreDetail.putt > 0 {
                            self.scoreDetail.putt -= 1
                        }
                    }
                    
                }, label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 35)
                        .overlay() {
                            Circle().stroke(.gray, lineWidth: 4)
                        }
                        .overlay() {
                            Image(systemName: "minus")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                }).buttonStyle(.borderless).padding(.trailing)
                
            }
        }
        
    }
}

struct HoleScoreCounterView_Previews: PreviewProvider {
    static var previews: some View {
        HoleScoreCounterView(type: "Shot").environmentObject(ScoreDetail())
    }
}
