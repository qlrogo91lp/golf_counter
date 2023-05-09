//
//  ScoreView.swift
//  GolfCounter
//
//  Created by 윤재 on 2023/05/08.
//

import SwiftUI

struct ScoreView: View {
    
    @Binding var maxHole: HoleType
    @State var score = Score()
    
    var body: some View {
        let item: String = maxHole.rawValue

        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "flag")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    
                    Text("Par \(item)")
                        .font(.system(size: 40))
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
                            .frame(width: 100, height: 100)
                            .overlay() {
                                Circle().stroke(.gray, lineWidth: 4)
                            }
                            .overlay() {
                                Image(systemName: "plus")
                                    .imageScale(.large)
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 20)
                    })
                    
                    Button(action: {
                        if(score.current > 0) {
                            score.current -= 1
                        }
                    }, label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 100, height: 100)
                            .overlay() {
                                Circle().stroke(.gray, lineWidth: 4)
                            }
                            .overlay() {
                                Image(systemName: "minus")
                                    .imageScale(.large)
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading, 20)
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
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.gray)
                    })
                }
                
                .padding()
            }
        }
    }
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(maxHole: .constant(.Par3))
    }
}
