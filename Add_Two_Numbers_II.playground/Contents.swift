import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func createList(data: [Int]) -> ListNode? {
    guard !data.isEmpty else { return nil }
    var rootNode: ListNode?
    var currentNode: ListNode?
    for value in data {
        let newNode = ListNode(value)
        if currentNode != nil {
            currentNode?.next = newNode
            currentNode = newNode
        } else {
            rootNode = newNode
            currentNode = rootNode
        }
    }
    return rootNode
}

func getNodeValue(root: ListNode?) {
    if root != nil {
        print(root!.val)
        getNodeValue(root: root?.next)
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else { return l2 }
    guard let l2 = l2 else { return l1 }

    var currentNode = l1.next
    var l1Value = [l1.val]

    while currentNode != nil {
        l1Value.append(currentNode!.val)
        currentNode = currentNode?.next
    }

    var l2Value = [l2.val]
    currentNode = l2.next
    while currentNode != nil {
        l2Value.append(currentNode!.val)
        currentNode = currentNode?.next
    }

    l1Value = l1Value.reversed()
    l2Value = l2Value.reversed()

    var sum = [Int]()
    var carry = 0

    for i in 0 ..< max(l1Value.count, l2Value.count) {
        let addition = calculateAdditionAndCarry(i < l1Value.count ? l1Value[i] : 0,
                                                 i < l2Value.count ? l2Value[i] : 0,
                                                 carry: &carry)
        sum.append(addition)
    }
    if carry > 0 {
        sum.append(carry)
    }
    sum = sum.reversed()
    var outputNode: ListNode?
    for val in sum {
        if outputNode == nil {
            outputNode = ListNode(val)
            currentNode = outputNode
        } else {
            currentNode?.next = ListNode(val)
            currentNode = currentNode?.next
        }
    }

    return outputNode
}

func calculateAdditionAndCarry(_ firstValue: Int, _ secondValue: Int, carry: inout Int) -> Int {
    let addition = firstValue + secondValue + carry
    carry = addition / 10
    return (addition % 10)
}

let l1 = createList(data: [7, 2, 4, 3])
let l2 = createList(data: [5, 6, 4])

getNodeValue(root: addTwoNumbers(l1, l2))

let l3 = createList(data: [9, 8, 9, 3])
let l4 = createList(data: [5, 6, 4])

getNodeValue(root: addTwoNumbers(l3, l4))
