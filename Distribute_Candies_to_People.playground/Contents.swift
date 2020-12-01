import UIKit

func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
    var output = [Int](repeating: 0, count: num_people)
    var remainingCandies = candies
    var repeatCount = 0
    for j in 1 ... candies {
        if j > num_people {
            remainingCandies -= j
            if remainingCandies > 0 {
                output[(j - 1) - (num_people * repeatCount)] += j
            } else {
                output[(j - 1) - (num_people * repeatCount)] += (remainingCandies + j)
                return output
            }
        } else {
            remainingCandies -= j
            if remainingCandies > 0 {
                output[j - 1] += j
            } else {
                output[j - 1] += (remainingCandies + j)
                return output
            }
        }
        repeatCount = j / num_people
    }
    return output
}

print(distributeCandies(60, 4)) // [15, 18, 15, 12]
