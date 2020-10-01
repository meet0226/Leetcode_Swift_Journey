

class RecentCounter {
    var slideWindow: [Int]
    init() {
        slideWindow = [Int]()
    }

    func ping(_ t: Int) -> Int {
        slideWindow.append(t)
        while !slideWindow.isEmpty {
            if (slideWindow.first! < (t - 3000)) {
                slideWindow.removeFirst()
            } else {
                break
            }
        }
        return slideWindow.count
    }
}


let recent = RecentCounter()
print(recent.ping(1))
print(recent.ping(100))
print(recent.ping(3001))
print(recent.ping(3002))
