import UIKit

func bitwiseComplement(_ N: Int) -> Int {
    guard N != 0 else { return 1 }
    let complementString = String(N, radix: 2).map { $0 == "0" ? "1" : "0"}.joined()
    return Int(complementString, radix: 2) ?? -1
}

print(bitwiseComplement(7))
print(bitwiseComplement(10))
print(bitwiseComplement(5))
