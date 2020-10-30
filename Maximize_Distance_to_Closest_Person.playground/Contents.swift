import UIKit

func maxDistToClosest(_ seats: [Int]) -> Int {
    var currentPosition = -1
    var maxDistance = 0
    var index = 0
    while index < seats.count {
        guard (currentPosition != -1 || seats[index] != 1) else {
            index += 1
            continue
        }
        if currentPosition == -1, seats[index] == 0 {
            currentPosition = index
        } else {
            if seats[index] == 1, currentPosition > 0 {
                let min = currentPosition - 1
                maxDistance = (index - min) == 1 ? max(maxDistance, 1) : max(maxDistance, (index - min)/2)
                currentPosition = index + 1
            } else if seats[index] == 1, currentPosition == 0 {
                maxDistance = index - currentPosition
                currentPosition = index + 1
            } else if index == seats.count - 1 {
                let min = currentPosition > 0 ? currentPosition - 1 : currentPosition
                maxDistance = max(index - min, maxDistance)
            }
        }
        index += 1
    }
    return maxDistance
}

print(maxDistToClosest([1,0,0,0,1,0,1]))
print(maxDistToClosest([1,0,0,0]))
print(maxDistToClosest([0,1]))
print(maxDistToClosest([0,0,0,0,0,1]))
print(maxDistToClosest([0,0,1,0,0,0,0,1,0,0]))
print(maxDistToClosest([0,0,1,0,0,0,0,0,1,0,0]))
print(maxDistToClosest([0,0,1,0,0,0,0,0,1,0,0,0]))
print(maxDistToClosest([0,0,1,0,0,0,0,0,1,0,0,0,0]))
print(maxDistToClosest([0,0,1,0,1,1]))
