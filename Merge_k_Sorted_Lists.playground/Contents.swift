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

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard !lists.isEmpty else { return nil }
    var listNodes = [ListNode?]()
    for list in lists {
        var currentNode = list
        while currentNode != nil {
            listNodes.append(ListNode(currentNode!.val))
            currentNode = currentNode?.next
        }
    }

    listNodes.sort { $0!.val < $1!.val }
    var outputNode: ListNode?
    var currentNode: ListNode?
    for node in listNodes {
        if outputNode == nil {
            outputNode = node
            currentNode = outputNode
        } else {
            currentNode?.next = node
            currentNode = node
        }
    }

    return outputNode
}

let l1 = createList(data: [1, 4, 5])
let l2 = createList(data: [1, 3, 4])
let l3 = createList(data: [2, 6])
getNodeValue(root: mergeKLists([l1, l2, l3]))

getNodeValue(root: mergeKLists([]))
getNodeValue(root: mergeKLists([l1]))
