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

func insertionSortList(_ head: ListNode?) -> ListNode? {
    let pseudoHead = ListNode()
    var curr = head
    var prevNode = head
    var nextNode = head

    while curr != nil {
        prevNode = pseudoHead
        nextNode = pseudoHead.next

        // find the position to insert the current node
        while (nextNode != nil) {
            if (curr!.val < nextNode!.val) { break }
            prevNode = nextNode
            nextNode = nextNode?.next
        }
        let nextIter = curr?.next
        // insert the current node to the new list
        curr?.next = nextNode
        prevNode?.next = curr

        // moving on to the next iteration
        curr = nextIter
    }

    return pseudoHead.next
}

let rootNode = createList(data: [4,2,1,3])
getNodeValue(root: rootNode)
print("Sort")
let sortedNode = insertionSortList(rootNode)
getNodeValue(root: sortedNode)
