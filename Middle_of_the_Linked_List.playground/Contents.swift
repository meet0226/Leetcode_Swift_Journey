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

func middleNode(_ head: ListNode?) -> ListNode? {
    var slowNode = head
    var fastNode = head?.next
    while fastNode != nil {
        slowNode = slowNode?.next
        fastNode = fastNode?.next?.next
    }
    return slowNode
}

// [1,2,3,4,5]

let rootNode = createList(data: [1,2,3,4,5])
getNodeValue(root: rootNode)
let outputNode = middleNode(rootNode)
print("Middle Node:\(outputNode?.val)")
