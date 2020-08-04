import UIKit

func removeDuplicates(_ nums: inout [Int]) -> Int {
       
   guard nums.count > 0 else {
       return 0
   }
   
   var currentPointingValue = nums[0]
   var deletedNumbers = 0
   
   for i in 1..<nums.count {
       if nums[i - deletedNumbers] == currentPointingValue {
           nums.remove(at: (i - deletedNumbers))
           deletedNumbers += 1
       } else {
           currentPointingValue = nums[i - deletedNumbers]
       }
   }

   return nums.count
}

var intergerArray = [0,0,1,1,1,2,2,3,3,4] //[1,1,2]
print("Array Length - \(removeDuplicates(&intergerArray))")
