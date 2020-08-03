import UIKit

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let numsThree = (nums1 + nums2).sorted()
    guard numsThree.count % 2 == 0 else {
        return Double(numsThree[numsThree.count/2])
    }
    let medianNumber = Double(numsThree[numsThree.count/2 - 1] + numsThree[numsThree.count/2]) / 2
    return medianNumber
}

let test1nums1 = [1,4,6,7]
let test1nums2 = [2,3,5,8]
let medianForTest1 = findMedianSortedArrays(test1nums1, test1nums2)
print(medianForTest1) // 4,5

let test2nums1 = [4,6,7]
let test2nums2 = [2,3,5,8]
let medianForTest2 = findMedianSortedArrays(test2nums1, test2nums2)
print(medianForTest2) // 5

let test3nums1 = [0]
let test3nums2 = [1]
let medianForTest3 = findMedianSortedArrays(test3nums1, test3nums2)
print(medianForTest3) // 0.5
