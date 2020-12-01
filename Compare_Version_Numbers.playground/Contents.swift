import UIKit

func compareVersion(_ version1: String, _ version2: String) -> Int {
    guard !version1.isEmpty || !version2.isEmpty else { return 0 }
    let version1Array = version1.components(separatedBy: ".")
    let version2Array = version2.components(separatedBy: ".")
    for i in 0 ..< max(version1Array.count, version2Array.count) {
        let version1Value = i < version1Array.count ? Int(version1Array[i])! : 0
        let version2Value = i < version2Array.count ? Int(version2Array[i])! : 0
        if version1Value > version2Value {
            return 1
        } else if version1Value < version2Value {
            return -1
        }
    }
    return 0
}

print(compareVersion("1.0", "1.0.1"))
print(compareVersion("0.1", "1.1"))
print(compareVersion("1.0.1", "1"))
print(compareVersion("7.5.2.4", "7.5.3"))
print(compareVersion("1.01", "1.001"))
print(compareVersion("1.0", "1.0.0"))
