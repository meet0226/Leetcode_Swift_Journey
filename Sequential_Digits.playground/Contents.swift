import UIKit

func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
    var output = [Int]()
    var startNumber = "1", count = 1, startNumbers = [Int]()
    while startNumber.count < 9 {
        count += 1
        startNumber.append(String(count))
        if Int(startNumber)! <= high {
            startNumbers.append(Int(startNumber)!)
        } else if Int(startNumber)! > high {
            break
        }
    }

    for number in startNumbers {
        var temp = number
        if (low ... high).contains(temp) {
            output.append(temp)
        }
        var tempString = String(temp)
        var stringNumberToBeAdded = ""
        for _ in 0 ..< tempString.count {
            stringNumberToBeAdded.append("1")
        }
        let numberToBeAdded = Int(stringNumberToBeAdded)!
        while tempString.count <= String(number).count {
            if tempString.contains("9") {
                break
            }
            temp += numberToBeAdded
            if temp > high {
                break
            }
            if (low ... high).contains(temp) {
                output.append(temp)
            }
            tempString = String(temp)
        }
    }

    return output
}

print(sequentialDigits(1, 90_000_000_000_000_000))
// print(sequentialDigits(58, 155))
