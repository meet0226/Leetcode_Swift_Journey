import UIKit

func romanToInt(_ s: String) -> Int {
    func romanValue(romanCharacter: String) -> Int {
        let romanAlphabetValues = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1]
        return romanAlphabetValues[romanCharacter] ?? 0
    }

    var romanToIntegerValue: Int = 0
    let characters = s.map { romanValue(romanCharacter: String($0)) }

    for i in 0 ..< characters.count {
        if i + 1 < characters.count, characters[i] < characters[i + 1] {
            romanToIntegerValue = romanToIntegerValue - characters[i]
        } else {
            romanToIntegerValue = romanToIntegerValue + characters[i]
        }
    }
    return romanToIntegerValue
}

print(romanToInt("MCMXCIV"))
print(romanToInt("LVIII"))
