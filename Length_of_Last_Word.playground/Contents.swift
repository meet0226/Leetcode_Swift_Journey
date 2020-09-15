import UIKit

func lengthOfLastWord(_ s: String) -> Int {
    let s = s.trimmingCharacters(in: .whitespacesAndNewlines).reversed()
    guard !s.isEmpty else { return 0 }
    if let firstIndex = s.firstIndex(of: " ") {
        return s.distance(from: s.startIndex, to: firstIndex)
    }
    return s.count
}

print(lengthOfLastWord("Hello  world"))
print(lengthOfLastWord("Hello  world "))
print(lengthOfLastWord(" Hello  world  "))
print(lengthOfLastWord("Helloworld"))
print(lengthOfLastWord(" "))
