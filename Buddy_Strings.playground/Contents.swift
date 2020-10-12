import UIKit

func buddyStrings(_ A: String, _ B: String) -> Bool {
    guard !A.isEmpty, !B.isEmpty, A.count == B.count else {
        return false
    }
    if A == B && Array(Set(A)).count != A.count { return true }
    let arrayA = Array(A)
    let arrayB = Array(B)
    var differentCharacters = [Character]()
    for i in 0..<A.count {
        if arrayA[i] == arrayB[i] {
            continue
        }
        differentCharacters.append(arrayA[i])
        differentCharacters.append(arrayB[i])
    }
    if differentCharacters.count == 4
        && differentCharacters[0] == differentCharacters[3]
        && differentCharacters[1] == differentCharacters[2] {
        return true
    }
    return false
}

print(buddyStrings("aab", "aab"))
print(buddyStrings("aabb", "aabb"))
print(buddyStrings("abc", "abc"))
print(buddyStrings("ab", "ba"))
print(buddyStrings("", "aab"))
print(buddyStrings("aab", ""))
print(buddyStrings("aab", "aa"))
print(buddyStrings("aa", "aa"))
print(buddyStrings("ab", "ab"))
print(buddyStrings("aaaaaaabc", "aaaaaaacb"))
print(buddyStrings("abcaa","abcbb"))
print(buddyStrings("ab","ca"))


let a = [1,1,2,7,4,5,6,6]
print(a.sorted { $0 == $1 })
