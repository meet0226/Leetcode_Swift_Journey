import Foundation

func repeatedSubstringPattern(_ s: String) -> Bool {
    guard s.count > 1, (s.count % (s.count / 2)) == 0 else { return false }
    var ss = s + s
    ss.removeLast()
    ss.removeFirst()
    return ss.contains(s)
}

print(repeatedSubstringPattern("abab"))
print(repeatedSubstringPattern("aabb"))
print(repeatedSubstringPattern("aba"))
print(repeatedSubstringPattern("abc"))
print(repeatedSubstringPattern("abca"))
print(repeatedSubstringPattern("abcabcabcabc"))
print(repeatedSubstringPattern("abcabdabcabdgabcabdabcabdg"))
print(repeatedSubstringPattern("aaaaa"))
print(repeatedSubstringPattern("ababba"))
print(repeatedSubstringPattern("abac"))
print(repeatedSubstringPattern("abacababacab"))
