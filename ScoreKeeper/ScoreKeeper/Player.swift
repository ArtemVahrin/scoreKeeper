
import Foundation
import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int
    var nameColor: Color
    
}
extension Player: Equatable{
    static func == (lhs: Player, rhs: Player) -> Bool{
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
