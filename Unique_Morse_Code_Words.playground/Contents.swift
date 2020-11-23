import UIKit

func uniqueMorseRepresentations(_ words: [String]) -> Int {
    let morseDict: [Character : String] = ["a": ".-", "b": "-...", "c": "-.-.", "d": "-..", "e": ".", "f": "..-.", "g": "--.", "h": "....", "i": "..", "j": ".---", "k": "-.-", "l": ".-..", "m": "--", "n": "-.", "o": "---", "p": ".--.", "q": "--.-", "r": ".-.", "s": "...", "t": "-", "u": "..-", "v": "...-", "w": ".--", "x": "-..-", "y": "-.--", "z": "--.."]
    var morseCodes = Set<String>()
    for word in words {
        var morseCode = ""
        for char in word {
            morseCode.append(morseDict[char]!)
        }
        morseCodes.insert(morseCode)
    }

    return morseCodes.count
}
