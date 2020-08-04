import UIKit

func strStr(_ haystack: String, _ needle: String) -> Int {
    
      guard needle.count > 0 else {
        return 0
    }
    
    let pattern = "\(needle)"
    let regex = try! NSRegularExpression(pattern: pattern)
    let match = regex.firstMatch(in: haystack, options: [], range: NSRange(location: 0, length: haystack.count))

    
    return match?.range.lowerBound ?? -1
    
}

print("Did we find the needle in the haystack -> \(strStr("hello", "ll"))")

