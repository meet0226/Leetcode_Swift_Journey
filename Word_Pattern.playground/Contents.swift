import UIKit

func wordPattern(_ pattern: String, _ str: String) -> Bool {
    let patternArray = Array(pattern)
    let strArray = str.components(separatedBy: " ")
    guard patternArray.count == strArray.count else { return false }
    var strHashmap = [String: Character]()
    var patternHashmap = [Character: String]()
    for i in 0 ..< patternArray.count {
        if strHashmap[strArray[i]] != nil || patternHashmap[patternArray[i]] != nil {
            if patternArray[i] != strHashmap[strArray[i]] || strArray[i] != patternHashmap[patternArray[i]] {
                return false
            }
        } else {
            strHashmap[strArray[i]] = patternArray[i]
            patternHashmap[patternArray[i]] = strArray[i]
        }
    }
    return true
}

print(wordPattern("abba", "dog cat cat dog"))
print(wordPattern("abba", "dog cat cat fish"))
print(wordPattern("abba", "dog dog dog dog"))
print(wordPattern("aaaa", "dog cat cat dog"))
