import UIKit

func isPowerOfFour(_ num: Int) -> Bool {
    let logValue = log(Double(num)) / log(4)
    return num > 0 && logValue == trunc(logValue)
}

print(isPowerOfFour(16)) // true
print(isPowerOfFour(10)) // false
print(isPowerOfFour(0)) // false
print(isPowerOfFour(1)) // true
print(isPowerOfFour(4)) // true
