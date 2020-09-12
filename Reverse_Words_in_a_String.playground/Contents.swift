import UIKit

func reverseWords(_ s: String) -> String {
    let sArray = s.components(separatedBy: " ").filter { !$0.isEmpty }.reversed()
    return sArray.joined(separator: " ")
}

print(reverseWords("  hello world!  "))
print(reverseWords("a good   example"))
print(reverseWords("     "))
