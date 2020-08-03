import UIKit

var str1 = "A man, a plan, a canal: Panama"
var str2 = "P0"
var str3 = "Stats"

func isPalindrome(_ str: String) -> Bool {
    let strLowerCased = str.lowercased()
    let actualString = strLowerCased.replacingOccurrences(of: "[^a-z0-9]+", with: "", options: .regularExpression)
    let reversedString = String(actualString.reversed())
    return reversedString == actualString
}

print(isPalindrome(str1)) // true
print(isPalindrome(str2)) // false
print(isPalindrome(str3)) // true
