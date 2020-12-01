import UIKit

func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
    let maxdistance = trips.reduce(0) { max($0, $1[2]) }
    var route = [Int](repeating: 0, count: maxdistance + 1)
    for trip in trips {
        route[trip[1]] += trip[0]
        route[trip[2]] -= trip[0]
    }
    for i in 1 ... maxdistance {
        route[i] += route[i - 1]
        if route[i] > capacity {
            return false
        }
    }
    return true
}

print(carPooling([[2, 1, 5], [3, 3, 7]], 4))
print(carPooling([[2, 1, 5], [3, 5, 7]], 4))
print(carPooling([[3, 2, 7], [3, 7, 9], [8, 3, 9]], 11))
