import UIKit

func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var asteroids = asteroids
    var index = asteroids.count - 1
    while index > 0 {
        guard asteroids[index] < 0 , asteroids[index - 1] > 0 else {
            index -= 1
            continue
        }
        if abs(asteroids[index]) == abs(asteroids[index - 1]) {
            asteroids.remove(at: index)
            asteroids.remove(at: index - 1)
            index -= index > asteroids.count ? 2 : 1
        } else if abs(asteroids[index]) > abs(asteroids[index - 1]) {
            asteroids.remove(at: index - 1)
            index -= index == asteroids.count ? 1 : 0
        } else {
            asteroids.remove(at: index)
            index -= index == asteroids.count ? 1 : 0
        }
    }
    return asteroids
}

print(asteroidCollision([5,10,-5]))
print(asteroidCollision([5,8,-8,10,-5]))
print(asteroidCollision([5,6,-2,8,-8,10,-5]))
print(asteroidCollision([8,-8]))
print(asteroidCollision([10,2,-5]))
print(asteroidCollision([-2,-1,1,2]))
print(asteroidCollision([-2,2,-1,-2]))
print(asteroidCollision([1,1,-1,-2]))
