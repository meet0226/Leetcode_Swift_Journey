import UIKit

func findTheDifference(_ s: String, _ t: String) -> Character {
    var s = s
    let arrayt = Array(t)
    for char in arrayt {
        if let index = s.firstIndex(of: char) {
            s.remove(at: index)
        } else {
            return char
        }
    }
    return Character("_")
}

func findTheDifference1(_ s: String, _ t: String) -> Character {
    var res = s.unicodeScalars.reduce(0) { $0 ^ $1.value }
    print(res)
    res = t.unicodeScalars.reduce(res) { $0 ^ $1.value }
    print(res)
    return Character(UnicodeScalar(res)!)
}

print(findTheDifference("abcd", "abcde"))
print(findTheDifference1("abcd", "abcda"))
