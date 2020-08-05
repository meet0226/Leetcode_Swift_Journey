import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashMap: [Int:Int] = [:]
    for i in 0..<nums.count {
        let a = target - nums[i]
        guard let index = hashMap[nums[i]] else {
            hashMap[a] = i
            continue
        }
        return [index,i]
    }
    return []
}

print(twoSum([2,3,6,11,15], 9))
