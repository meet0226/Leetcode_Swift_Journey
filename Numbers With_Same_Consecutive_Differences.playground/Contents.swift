import UIKit

func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
    guard N > 1 else { return [0,1,2,3,4,5,6,7,8,9] }
    var output = [Int]()
    for i in 1...9 {
        var numberArray = [i]
        for _ in 1..<N {
            var tempArray = [Int]()
            for number in numberArray {
                if (number%10)+K < 10 {
                    tempArray.append(number*10 + ((number%10)+K))
                }
                if (number%10) - abs((number%10)-K) == K , K != 0 {
                    tempArray.append(number*10 + abs((number%10)-K))
                }
            }
            numberArray = tempArray
        }
        output.append(contentsOf: numberArray)
    }
    return output.sorted()
}

print(numsSameConsecDiff(2, 0))  // [11, 22, 33, 44, 55, 66, 77, 88, 99]
