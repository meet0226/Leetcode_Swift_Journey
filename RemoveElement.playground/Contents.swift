import UIKit

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    
    var valuesRemoved = 0
    
    guard nums.count > 0 else {
        return 0
    }
    
    for i in 0..<nums.count {
        if nums[i - valuesRemoved] == val {
            nums.remove(at: (i - valuesRemoved))
            valuesRemoved += 1
        }
    }
    
    return nums.count
}



var integerArray = [0,1,2,2,3,0,4,2] //[3,2,2,3]
print("Length -> \(removeElement(&integerArray, 2))")
