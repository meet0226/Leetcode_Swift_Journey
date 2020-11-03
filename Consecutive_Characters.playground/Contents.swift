import UIKit

func maxPower(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }
    var result = 1
    var currentCharacter = s.first!
    var currentCharacterCount = 0
    for char in s {
        if char == currentCharacter {
            currentCharacterCount += 1
        } else {
            result = max(currentCharacterCount, result)
            currentCharacter = char
            currentCharacterCount = 1
        }
    }
    return currentCharacterCount > result ? currentCharacterCount : result
}

print(maxPower("leetcode"))
print(maxPower("abbcccddddeeeeedcba"))
print(maxPower("triplepillooooow"))
print(maxPower("hooraaaaaaaaaaay"))
print(maxPower("tourist"))
print(maxPower("cc"))
print(maxPower("c"))
