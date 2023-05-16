//
//  ScoreView.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/09.
//

import SwiftUI

struct SingleGameCounterView: View {
    
    @Binding var maxHole: HoleType
    @State var score = Score()
    
    var body: some View {
        let item: String = maxHole.rawValue

        VStack {
            HStack {
                Image(systemName: "flag.fill")
                    .imageScale(.large)
                    .foregroundColor(.blue)
                
                Text("Par \(item)")
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.blue)
            }
            .padding()
            
            HStack {
                Button(action: {
                    if(score.current < (Int(item)!)*2) {
                        score.current += 1
                    }
                }, label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        .overlay() {
                            Circle().stroke(.gray, lineWidth: 4)
                        }
                        .overlay() {
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                })
                
                Button(action: {
                    if(score.current > 0) {
                        score.current -= 1
                    }
                }, label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 70, height: 70)
                        .overlay() {
                            Circle().stroke(.gray, lineWidth: 4)
                        }
                        .overlay() {
                            Image(systemName: "minus")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                })
                
            }
            .padding()
            
            Text("+ \(score.current)")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.white)
            
            HStack {
                Button(action: {
                    score.current = 0
                }, label: {
                    Text("Reset")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.gray)
                })
            }
        }
    }
    
}

struct SingleGameCounterView_Previews: PreviewProvider {
    static var previews: some View {
        SingleGameCounterView(maxHole: .constant(.Par5))
    }
}
