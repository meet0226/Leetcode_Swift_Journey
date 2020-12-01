import UIKit

func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count > 0 else {
        return ""
    }

    var shortestLengthStringCount: Int = strs[0].count
    var longestCommonPrefix: String = ""
    var globalArrayCounter = 0
    let firstStringElement = strs[0]

    func recheckShortestStringCount(_ count: Int) {
        shortestLengthStringCount = (shortestLengthStringCount > count) ? count : shortestLengthStringCount
    }

    for shortestLengthStringCounter in 0 ..< shortestLengthStringCount {
        for var arrayCounter in 1 ..< strs.count {
            recheckShortestStringCount(strs[arrayCounter].count)
            if firstStringElement.prefix(shortestLengthStringCounter + 1) != strs[arrayCounter].prefix(shortestLengthStringCounter + 1) {
                return longestCommonPrefix
            }
            globalArrayCounter = arrayCounter
            arrayCounter += 1
        }
        longestCommonPrefix = String(strs[globalArrayCounter].prefix(shortestLengthStringCounter + 1))
    }

    return longestCommonPrefix
}

print(longestCommonPrefix(["flower", "flow", "flight", "fl"]))
