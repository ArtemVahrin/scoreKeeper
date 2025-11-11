//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Артём on 01.05.2025.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {

    
    
    @Test("Reset Player Score", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0, nameColor: .black),
            Player(name: "Andre", score: 5, nameColor: .black),
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Higher score wins")
    func highereScoreWins(){
        
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0, nameColor: .black),
            Player(name: "Andre", score: 4, nameColor: .black),
        ],
                                    state: .gameOver,
                                    doesHigherScoreWin: true
        )
        let winners = scoreboard.winers
        #expect(winners == [Player(name: "Andre", score: 4, nameColor: .black)])
        }
    
    @Test("Lower score wins")
    func lowerScoreWins(){
        
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0, nameColor: .black),
            Player(name: "Andre", score: 4, nameColor: .black),
        ],
                                    state: .gameOver,
                                    doesHigherScoreWin: false
        )
        let winners = scoreboard.winers
        #expect(winners == [Player(name: "Elisha", score: 0, nameColor: .black)])
        }
    }

