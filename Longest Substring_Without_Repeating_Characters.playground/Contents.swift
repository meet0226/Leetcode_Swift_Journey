import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 1 else { return s.count }
    var highestCount = 0
    var currentSubstring: [Character] = []
    for char in s {
        if let index = currentSubstring.firstIndex(of: char) {
            currentSubstring.removeFirst(index+1)
        }
        currentSubstring.append(char)
        highestCount = max(highestCount, currentSubstring.count)
    }
    return highestCount
}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))
print(lengthOfLongestSubstring(""))
print(lengthOfLongestSubstring(" "))
print(lengthOfLongestSubstring("abcd"))
print(lengthOfLongestSubstring("dvdf"))
print(lengthOfLongestSubstring("edvdfg"))
print(lengthOfLongestSubstring("edv"))
