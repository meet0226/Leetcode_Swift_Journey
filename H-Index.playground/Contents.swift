import UIKit

func hIndex(_ citations: [Int]) -> Int {
    let arrayCitationsCount = citations.count
    let sortedCitations = citations.sorted()
    for i in 0 ..< arrayCitationsCount
        where sortedCitations[i] >= arrayCitationsCount - i
    {
        return arrayCitationsCount - i
    }
    return 0
}

let input = [3, 0, 6, 1, 5]
let output = hIndex(input) // 3

let input1 = [3, 0, 6, 7, 1, 5]
let output1 = hIndex(input1) // 3

let input2 = [3, 0, 6, 7, 8, 1, 5]
let output2 = hIndex(input2) // 4
