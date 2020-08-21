import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reorderList(_ head: ListNode?) {
    guard head != nil else { return }
    var middleNode = head
    var lastNode = head?.next
    while lastNode != nil {
        middleNode = middleNode?.next
        lastNode = lastNode?.next?.next
    }
    while middleNode != nil {
        let next = middleNode?.next
        middleNode?.next = lastNode
        lastNode = middleNode
        middleNode = next
    }
    var main = head
    while lastNode?.next != nil {
        var nextNode = main?.next
        main?.next = lastNode
        main = nextNode
        nextNode = lastNode?.next
        lastNode?.next = main
        lastNode = nextNode
    }
    getNodeValue(root: head)
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

let rootNode = createList(data: [1,2,3,4,5,6])
reorderList(rootNode)
