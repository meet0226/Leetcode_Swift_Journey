import UIKit

func isValid(_ s: String) -> Bool {

   var result: Bool = false
   let stringLength = s.count
   let inputStringArray = Array(s)
   let allowedCharacters = CharacterSet(charactersIn: "(){}[]")
   var stack: [Character] = []
   
   func complementaryClosingBracket(_ bracket: Character) -> Character {
       
       switch bracket {
           case "{":
               return "}"
           case "}":
               return "{"
           case "[":
               return "]"
           case "]":
               return "["
           case "(":
               return ")"
           case ")":
               return "("
           default:
               return "}"
       }
       
   }
   
   if stringLength%2 != 0 || s.rangeOfCharacter(from: allowedCharacters.inverted) != nil
   {
       result = false
   } else if stringLength == 0 {
       result = true
   } else {
       for i in 0..<inputStringArray.count {
           let stackCount = stack.count
           if stackCount > 0 &&
               (inputStringArray[i] == complementaryClosingBracket(stack[stackCount-1])) {
               stack.remove(at: (stackCount-1))
           } else {
               stack.append(inputStringArray[i])
           }
       }
       result = (stack.count == 0)
   }

   return result
}

print("is valid - \(isValid("[](){}"))")
