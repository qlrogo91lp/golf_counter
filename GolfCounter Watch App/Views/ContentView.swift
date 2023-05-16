//
//  ContentView.swift
//  GolfCounter Watch App
//
//  Created by 윤재 on 2023/04/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SingleGameView()) {
                    Text("Single Game")
                }
                NavigationLink(destination: ScoreListView()) {
                    Text("Score Board")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
