//
//  SingleGameCounter.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/05/12.
//

import SwiftUI

enum HoleType: String, CaseIterable, Identifiable {
    case Par3 = "3"
    case Par4 = "4"
    case Par5 = "5"
    
    var id: String { self.rawValue }
}

struct SingleGameView: View {
    @State private var maxHole = HoleType.Par3
    
    var body: some View {
        VStack {
            Picker("Hole Type", selection: $maxHole) {
                ForEach(HoleType.allCases) { type in
                    Text(type.rawValue)
                        .font(.system(size: 25))
                        .tag(type)
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 80)
            .padding()
            
            NavigationLink(destination: SingleGameCounterView(maxHole: $maxHole)) {
                Text("Confirm")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
            }
        }
    }
}

struct SingleGameView_Previews: PreviewProvider {
    static var previews: some View {
        SingleGameView()
    }
}
