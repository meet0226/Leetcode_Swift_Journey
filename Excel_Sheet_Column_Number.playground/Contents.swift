import UIKit

func titleToNumber(_ s: String) -> Int {
    var integerValue = 0
    for char in s.utf8 {
        integerValue = integerValue * 26 + (Int(char) - 64)
    }
    return integerValue
}

var str = "A"
print(titleToNumber(str)) // 1

var str1 = "Z"
print(titleToNumber(str1)) // 26

var str2 = "AB"
print(titleToNumber(str2)) // 28

var str3 = "ZY"
print(titleToNumber(str3)) // 701

