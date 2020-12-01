
func rand7() -> Int {
    return Int.random(in: 0 ... 7)
}

func rand10() -> Int {
    var row = Int(), col = Int(), idx = Int()
    while idx < 40 {
        row = rand7()
        col = rand7()
        idx = col + ((row - 1) * 7)
    }
    return 1 + ((idx - 1) % 10)
}

print(rand10())
print(rand10())
print(rand10())
print(rand10())
print(rand10())
print(rand10())
print(rand10())
print(rand10())
print(rand10())
print(rand10())
