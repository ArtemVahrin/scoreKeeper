//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Артём on 02.05.2025.
//

import Foundation
struct Scoreboard{
    var players: [Player] = [
        Player(name: "Elisha", score: 0, nameColor: .black),
        Player(name: "Andre", score: 0, nameColor: .black),
        Player(name: "Jasmine", score: 0, nameColor: .black),
    ]
    
    var state = GameState.setup
    var doesHigherScoreWin = true
    
    var winers: [Player] {
        guard state == .gameOver else { return [] }
        
        var winingScore = 0
        if doesHigherScoreWin {
            winingScore = Int.min
            for player in players{
                winingScore = max(player.score, winingScore)
            }
        } else {
            winingScore = Int.max
            for player in players{
                winingScore = min(player.score, winingScore)
            }
        }
        
        return players.filter { player in
            player.score == winingScore
            
        }
    }
        mutating func resetScores (to newValue: Int) {
            
            for index in 0..<players.count{
                players[index].score = newValue
            }
            
        }
    }
