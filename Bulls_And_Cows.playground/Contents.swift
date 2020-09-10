import UIKit

func getHint(_ secret: String, _ guess: String) -> String {
    var secret = secret, guess = guess
    var bulls = 0, cows = 0
    var hashmap = [Int: Character]()
    var index = 0
    for char in secret {
        hashmap[index] = char
        index += 1
    }
    index = 0
    for char in guess {
        if secret.contains(char) && char == hashmap[index] {
            bulls += 1
            if let idx = secret.firstIndex(of: char) {
                secret.remove(at: idx)
            }
            if let idx = guess.firstIndex(of: char) {
                guess.remove(at: idx)
            }
        }
        index += 1
    }
    for char in guess {
        if secret.contains(char) {
            cows += 1
            if let idx = secret.firstIndex(of: char) {
                secret.remove(at: idx)
            }
        }
    }
    return "\(bulls)A\(cows)B"
}

print(getHint("1107", "7110"))
print(getHint("1807", "7810"))
print(getHint("1101", "1110"))
print(getHint("1123", "0111"))
print(getHint("1122", "2211"))
print(getHint("1122", "1222"))
