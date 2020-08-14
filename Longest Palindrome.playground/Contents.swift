import UIKit

func longestPalindrome(_ s: String) -> Int {
    let count = s.reduce(into: [:], { $0[$1, default: 0] += 1 })
        .reduce(0, { $0 + ($1.value % 2 == 0 ? $1.value : $1.value - 1) })

    return count < s.count ? count + 1 : count
}


print(longestPalindrome("abccccdd")) // 7
