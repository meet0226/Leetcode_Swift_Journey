import UIKit

class CombinationIterator {
    private class Combination {
        var value: String?
        var nextCombination: Combination?
    }

    private var rootCombination: Combination?
    private var activeCombination: Combination?
    private var currentCombination: Combination?

    init(_ characters: String, _ combinationLength: Int) {
        if characters.count <= combinationLength {
            rootCombination = Combination()
            rootCombination?.value = characters
        } else {
            createCombinations(characters: Array(characters),
                               combinationLength: combinationLength,
                               index: 0,
                               current: "")
        }
        currentCombination = rootCombination
    }

    private func createCombinations(characters: [Character], combinationLength: Int, index: Int, current: String) {
        if current.count == combinationLength {
            let combination = Combination()
            combination.value = current
            if rootCombination != nil {
                activeCombination?.nextCombination = combination
                activeCombination = combination
            } else {
                rootCombination = combination
                activeCombination = combination
            }
            return
        }
        for i in index ..< characters.count {
            if current.count < combinationLength {
                createCombinations(characters: characters,
                                   combinationLength: combinationLength,
                                   index: i + 1,
                                   current: current + String(characters[i]))
            }
        }
    }

    func next() -> String {
        let combination = currentCombination
        currentCombination = currentCombination?.nextCombination
        return combination?.value ?? ""
    }

    func hasNext() -> Bool {
        return currentCombination == nil ? false : true
    }
}

let iterator = CombinationIterator("abcd", 2)
iterator.next()
iterator.hasNext()
iterator.next()
iterator.hasNext()
iterator.next()
iterator.hasNext()
iterator.next()
iterator.hasNext()
iterator.next()
iterator.hasNext()
iterator.next()
iterator.hasNext()
iterator.next()
iterator.hasNext()
