import UIKit


enum Parentheses: String {
    case openSmallBracket = "("
    case openCurlyBracket = "{"
    case openBigBracket = "["
    case closeSmallBracket = ")"
    case closeCurlyBracket = "}"
    case closeBigBracket = "]"
}

func isValid(_ s: String) -> Bool {
    guard s.count > 1 else { return false }
    var arrayParentheses: [Parentheses] = [Parentheses(rawValue: String(s.first!))!]
    var currentParentheses: String = ""
    if String(s.first!) == Parentheses.openBigBracket.rawValue || String(s.first!) == Parentheses.openCurlyBracket.rawValue || String(s.first!) == Parentheses.openSmallBracket.rawValue {
        currentParentheses = String(s.first!)
    } else {
        return false
    }
    var ss = s
    ss.removeFirst()
    for char in ss {
        switch Parentheses(rawValue: String(char))! {
        case .openSmallBracket,.openBigBracket,.openCurlyBracket :
            arrayParentheses.append(Parentheses(rawValue: String(char))!)
            currentParentheses = String(char)
        case .closeCurlyBracket:
            if currentParentheses == Parentheses.openCurlyBracket.rawValue {
                arrayParentheses.removeLast()
                if let newCurrentParentheses = arrayParentheses.last {
                    currentParentheses = newCurrentParentheses.rawValue
                } else {
                    currentParentheses = ""
                }
            } else {
                return false
            }
        case .closeBigBracket:
            if currentParentheses == Parentheses.openBigBracket.rawValue {
                arrayParentheses.removeLast()
                if let newCurrentParentheses = arrayParentheses.last {
                    currentParentheses = newCurrentParentheses.rawValue
                } else {
                    currentParentheses = ""
                }
            } else {
                return false
            }
        case .closeSmallBracket:
            if currentParentheses == Parentheses.openSmallBracket.rawValue {
                arrayParentheses.removeLast()
                if let newCurrentParentheses = arrayParentheses.last {
                    currentParentheses = newCurrentParentheses.rawValue
                } else {
                    currentParentheses = ""
                }
            } else {
                return false
            }
        }
    }
    return arrayParentheses.isEmpty
}


print(isValid("{[]}"))
print(isValid("()[]{}"))
print(isValid("(]"))
print(isValid("([)]"))
print(isValid("}]"))
print(isValid("(("))
print(isValid("(){}}{"))
