import UIKit

func findRepeatedDnaSequences(_ s: String) -> [String] {
    guard s.count > 10 else { return [] }
    let s = Array(s)
    var hashMap = [String: Int]()
    for i in 0...(s.count-10) {
        let str = String(s[i..<i+10])
        hashMap[str, default: 0] += 1
    }
    return hashMap.filter { $0.value > 1 }.map { $0.key }
}

print(findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
print(findRepeatedDnaSequences("AAAAACCCCCAA"))
print(findRepeatedDnaSequences("ACACACACACAC"))
print(findRepeatedDnaSequences("AAAAAAAAAAAAA"))
print(findRepeatedDnaSequences("AAAAAAAAAA"))
print(findRepeatedDnaSequences("GAGAGAGAGAGA"))
