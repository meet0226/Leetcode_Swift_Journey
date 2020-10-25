import UIKit

func bagOfTokensScore(_ tokens: [Int], _ P: Int) -> Int {
    guard !tokens.isEmpty else { return 0 }
    var score = 0
    var tokens = tokens.sorted()
    var power = P
    guard tokens.first! <= P else { return 0 }
    while !tokens.isEmpty {
        if tokens.first! <= power {
            power -= tokens.first!
            tokens.removeFirst()
            score += 1
            continue
        } else if tokens.count == 1 { break }
        score -= 1
        power += tokens.last!
        tokens.removeLast()
    }
    return score
}

print(bagOfTokensScore([100,200,300,400], 200))
print(bagOfTokensScore([100,200], 150))
print(bagOfTokensScore([100], 50))
print(bagOfTokensScore([100,300,200,400], 200))
print(bagOfTokensScore([100,200,350,400], 200))
print(bagOfTokensScore([100,200,200,400], 200))
print(bagOfTokensScore([71,55,82],54))
print(bagOfTokensScore([71,54,82],54))

