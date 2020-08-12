import UIKit

func getRow(_ rowIndex: Int) -> [Int] {
    var hashMap = [Int: [Int]]()
    for i in 0...rowIndex {
        if let previousArray = hashMap[i-1] {
            hashMap[i] = [1]
            for j in 0..<previousArray.count {
                if j+1 < previousArray.count {
                    let value = previousArray[j] + previousArray[j+1]
                    hashMap[i]?.append(value)
                }
            }
            hashMap[i]?.append(1)
        } else {
            hashMap[i] = [1]
        }
    }
    return hashMap[rowIndex] ?? [0]
}

let output1 = getRow(3) // [1, 3, 3, 1]
let output2 = getRow(4) // [1, 4, 6, 4, 1]
