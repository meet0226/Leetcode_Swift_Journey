
func pancakeSort(_ A: [Int]) -> [Int] {
    guard A.count > 1 else { return [] }
    var output = [Int]()
    var isSorted = isSortedArray(A)
    var B = A
    while !isSorted {
        var indexOfLargestNumber = 0
        for i in 0..<B.count {
            if B[indexOfLargestNumber] < B[min(i+1, B.count - 1)] {
                indexOfLargestNumber = i + 1
            }
        }
        if indexOfLargestNumber != 0 {
            output.append(indexOfLargestNumber + 1)
            B = swapData(B, indexOfLargestNumber)
        }
        output.append(B.count)
        B = swapData(B, B.count - 1)
        B.removeLast()
        isSorted = isSortedArray(B)
    }
    return output
}

func isSortedArray(_ array: [Int]) -> Bool {
    for i in 0..<array.count-1 {
        if array[i] > array[i+1] {
            return false
        }
    }
    return true
}

func swapData(_ array: [Int],_ lastIndex: Int) -> [Int] {
    var array = array
    var i = 0
    var j = lastIndex
    while i < j {
        let temp = array[j]
        array[j] = array[i]
        array[i] = temp
        i += 1
        j -= 1
    }
    return array
}
