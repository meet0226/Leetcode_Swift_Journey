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

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard l1 != nil else { return l2 }
    guard l2 != nil else { return l1 }
    var mergedNode: ListNode?

    mergedNode = l2!.val > l1!.val ? l1 : l2
    mergedNode?.next = l2!.val > l1!.val ? mergeTwoLists(mergedNode?.next, l2) : mergeTwoLists(l1, mergedNode?.next)
    return mergedNode
}

let l1 = createList(data: [1, 2, 4])
let l2 = createList(data: [1, 3, 4])
getNodeValue(root: mergeTwoLists(l1, l2))
