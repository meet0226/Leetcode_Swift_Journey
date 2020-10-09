import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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
    var carry = 0
    let firstNodeAddition = calculateAdditionAndCarry(l1.val, l2.val, carry: &carry)
    let l3 = ListNode(firstNodeAddition)

    var currentFirstNode: ListNode? = l1.next
    var currentSecondNode: ListNode? = l2.next
    if currentFirstNode == nil && currentSecondNode == nil {
        if carry > 0 {
            l3.next = ListNode(carry)
        }
        return l3
    }
    var currentNewNode: ListNode? = l3
    while (currentFirstNode != nil || currentSecondNode != nil) {
        let addition = calculateAdditionAndCarry(currentFirstNode?.val ?? 0, currentSecondNode?.val ?? 0, carry: &carry)
        currentFirstNode = currentFirstNode?.next
        currentSecondNode = currentSecondNode?.next
        currentNewNode?.next = ListNode(addition)
        currentNewNode = currentNewNode?.next
    }
    if carry > 0 {
        currentNewNode?.next = ListNode(carry)
    }
    return l3
}

func calculateAdditionAndCarry(_ firstValue: Int, _ secondValue: Int, carry: inout  Int) -> Int {
    let addition = firstValue + secondValue + carry
    carry = addition/10
    return (addition%10)
}

let l1 = createList(data: [2,4,3])
let l2 = createList(data: [5,6,4])

getNodeValue(root: addTwoNumbers(l1, l2))

let l11 = createList(data: [9,1])
let l21 = createList(data: [9,1])

getNodeValue(root: addTwoNumbers(l11, l21))

let l12 = createList(data: [9,9,9,9,9,9,9])
let l22 = createList(data: [9,9,9,9])

getNodeValue(root: addTwoNumbers(l12, l22))
