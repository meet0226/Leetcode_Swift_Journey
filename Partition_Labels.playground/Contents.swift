
func partitionLabels(_ S: String) -> [Int] {
    guard !S.isEmpty else { return [] }
    var output = [Int]()
    let characters = Array(S)
    var hashmap = [Character: Int]()
    for i in 0..<characters.count {
        hashmap[characters[i]] = i
    }
    print(hashmap)
    var index = 0
    while index < characters.count {
        let endCharacter = characters[index]
        for i in 0...hashmap[endCharacter]! {
            if hashmap[endCharacter]! < hashmap[characters[i]]! {
                index = i
                break
            } else {
                index = i
            }
        }
        if index == hashmap[endCharacter] {
            index += 1
            output.append(index - output.reduce(0, +))
        }
    }
    return output
}

print(partitionLabels("ababcbacadefegdehijhklij"))
print(partitionLabels("abaccbdeffed"))
print(partitionLabels("abcdefabcdef"))
print(partitionLabels("eaaaabaaec"))
