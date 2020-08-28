func findRightInterval(_ intervals: [[Int]]) -> [Int] {
    guard !intervals.isEmpty, intervals.count > 1 else { return [-1] }
    var hashMap = [[Int]:Int]()
    for i in 0..<intervals.count {
        hashMap[intervals[i]] = i
    }
    let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })
    var output = Array(repeating: -1, count: sortedIntervals.count)
    for j in 0..<sortedIntervals.count {
        var nextIntervalIndex = -1
        for i in j+1..<sortedIntervals.count {
            if sortedIntervals[j][1] <= sortedIntervals[i][0] {
                nextIntervalIndex = hashMap[sortedIntervals[i]]!
                break
            }
        }
        output[hashMap[sortedIntervals[j]]!] = nextIntervalIndex
    }
    return output
}

//print(findRightInterval([[1,4], [2,3], [3,4] ]))
//print(findRightInterval([[3,4], [2,3], [1,2] ]))
//print(findRightInterval([ [1,2] ]))
//print(findRightInterval([[1,2],[2,3],[0,1],[3,4]]))
