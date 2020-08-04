import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashMap: [Int:Int] = [:]
    var finalIndexes: [Int] = []
    for i in 0..<nums.count {
        let a = target - nums[i]
        hashMap[a] = i
    }
    for j in 0..<nums.count {
        if hashMap[nums[j]] != nil {
            finalIndexes.append(j)
            finalIndexes.append(hashMap[nums[j]] ?? -5)
            break
        }
    }
    return finalIndexes
}

print(twoSum([2,7,11,15], 9))
