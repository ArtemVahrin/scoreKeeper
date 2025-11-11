//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by Артём on 02.05.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHigherScoreWin: Bool
    @Binding var startingPoints: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Game Rules")
                .font(.headline)
            
            Divider()
            Picker("Win condition", selection: $doesHigherScoreWin){
                Text("Highest score wins")
                    .tag(true)
                Text("Lowest score wins")
                    .tag(false)
            }
            
            Picker("Starting Points", selection: $startingPoints){
                Text("0 Starting points")
                    .tag(0)
                Text("10 Starting points")
                    .tag(10)
                Text("20 Starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))

    }
}

#Preview {
    @Previewable @State var startingPoints = 10
    @Previewable @State var doesHigherScoreWin = true
    
    SettingsView(doesHigherScoreWin: $doesHigherScoreWin,
                 startingPoints: $startingPoints)
}
