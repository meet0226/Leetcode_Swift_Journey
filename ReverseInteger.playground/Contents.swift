import UIKit

func reverse(_ x: Int) -> Int {
    if x > Int32.max || x < Int32.min {
        return 0
    }

    var reversedInteger: Int32 = 0
    var remainder: Int32 = 0
    var givenInteger = Int32(x)

    while givenInteger != 0 {
        guard Int(abs(reversedInteger)) * 10 <= Int32.max else {
            return 0
        }
        remainder = givenInteger % 10
        reversedInteger = reversedInteger * 10 + remainder
        givenInteger = givenInteger / 10
    }

    return Int(reversedInteger)
}

print(reverse(201))
print(reverse(1_534_236_469))
print(reverse(-2_147_483_648))
