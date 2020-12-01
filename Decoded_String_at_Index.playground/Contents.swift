import UIKit

func decodeAtIndex(_ S: String, _ K: Int) -> String {
    var size = 0
    let charArray = Array(S)
    for i in S.indices {
        if let intValue = Int(String(S[i])) {
            size *= intValue
        } else {
            size += 1
        }
    }
    guard K <= size else { return "" }
    var K = K
    for i in stride(from: S.count - 1, through: 0, by: -1) {
        K = K % size
        if K == 0, charArray[i].isLetter {
            return String(charArray[i])
        }
        if let intValue = Int(String(charArray[i])) {
            size /= intValue
        } else {
            size -= 1
        }
    }
    return ""
}

print(decodeAtIndex("leet2code3", 10))
print(decodeAtIndex("ha22", 5))
print(decodeAtIndex("a2345678999999999999999", 1))
print(decodeAtIndex("we", 3))
print(decodeAtIndex("ixm5xmgo78", 711))
print(decodeAtIndex("a2b3c4d5e6f7g8h9", 10))
print(decodeAtIndex("ua62y5bd82msdkk52q65", 474_494))
