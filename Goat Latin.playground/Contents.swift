import UIKit

func toGoatLatin(_ S: String) -> String {
    let stringArray = S.split(separator: " ")
    var outputString = ""
    let vowels = ["a", "e", "i", "o", "u"]
    var suffix = "maa"
    for var singleString in stringArray {
        if let firstChar = singleString.first, !vowels.contains(String(firstChar.lowercased())) {
            singleString.remove(at: singleString.startIndex)
            singleString += String(firstChar)
        }
        singleString += suffix
        suffix += "a"
        outputString = String(outputString.isEmpty ? singleString : (outputString + (" " + singleString)))
    }
    return outputString
}

print(toGoatLatin("The quick brown fox jumped over the lazy dog"))

// heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa
