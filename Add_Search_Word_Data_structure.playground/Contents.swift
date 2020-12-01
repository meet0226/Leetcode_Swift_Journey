import UIKit

class WordDictionary {
    class WordNode {
        var nextNode: [String: WordNode] = [:]
        var character = ""
        var isEndChar = false
    }

    var wordNode = WordNode()

    /** Initialize your data structure here. */
    init() {}

    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var tempWordNode = wordNode
        for char in word {
            let stringChar = String(char)
            if let value = tempWordNode.nextNode[stringChar] {
                tempWordNode = value
            } else {
                let newWordNode = WordNode()
                newWordNode.character = stringChar
                tempWordNode.nextNode[stringChar] = newWordNode
                tempWordNode = newWordNode
            }
        }
        tempWordNode.isEndChar = true
    }

    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        let tempWordNode = wordNode
        return searchWithNode(tempWordNode, word: Array(word), index: 0)
    }

    func searchWithNode(_ wordNode: WordNode, word: [Character], index: Int) -> Bool {
        if index == word.count { return wordNode.isEndChar }
        let stringchar = String(word[index])
        if stringchar != "." {
            return wordNode.nextNode[stringchar] != nil && searchWithNode(wordNode.nextNode[stringchar]!, word: word, index: index + 1)
        } else {
            for (_, value) in wordNode.nextNode {
                if searchWithNode(value, word: word, index: index + 1) {
                    return true
                }
            }
        }
        return false
    }
}

let wordDictionary = WordDictionary()
wordDictionary.addWord("ran")
wordDictionary.addWord("rune")
wordDictionary.addWord("runner")
wordDictionary.addWord("runs")
wordDictionary.addWord("add")
wordDictionary.addWord("adds")
wordDictionary.addWord("adder")
wordDictionary.addWord("addee")

print(wordDictionary.search("r.n")) // true
print(wordDictionary.search("ru.n.e")) // false
print(wordDictionary.search("add")) // true
print(wordDictionary.search("add.")) // true
print(wordDictionary.search("adde.")) // true
print(wordDictionary.search(".an.")) // false
print(wordDictionary.search("...s")) // true
print(wordDictionary.search("....e.")) // true
print(wordDictionary.search(".......")) // false
print(wordDictionary.search("..n.r")) // false

[true,
 false,
 true,
 true,
 true,
 false,
 true,
 true,
 false,
 false]
