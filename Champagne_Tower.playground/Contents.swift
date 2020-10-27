import UIKit

func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
    var output: [[Double]] = Array(repeating: Array(repeating: 0.0, count: query_row+2), count: query_row+2)
    output[0][0] = Double(poured)

    for row in 0...query_row {
        for cup in 0...row {
            let flow = (output[row][cup] - 1.0)/2.0
            if flow > 0 {
                output[row+1][cup] += flow
                output[row+1][cup+1] += flow
            }
        }
    }
    return output[query_row][query_glass] > 1.0 ? 1.0 : output[query_row][query_glass]
}

print(champagneTower(8, 3, 3))
print(champagneTower(100000009, 33, 17))
print(champagneTower(100000009, 99, 17))
