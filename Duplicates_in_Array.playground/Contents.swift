import UIKit

func findDuplicates(_ nums: [Int]) -> [Int] {
    return Array(Dictionary(grouping: nums, by: { $0 }).filter { $1.count > 1 }.keys).sorted()
}

let duplicates = findDuplicates([4, 3, 2, 7, 8, 2, 3, 1]) // [2,3]
