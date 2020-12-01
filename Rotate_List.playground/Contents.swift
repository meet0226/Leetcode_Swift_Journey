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

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil, k > 0, head?.next != nil else { return head }
    var nodes = [ListNode?]()
    var currentNode = head

    while currentNode != nil {
        nodes.append(currentNode)
        currentNode = currentNode?.next
    }

    currentNode = ListNode(-1)

    var newNodeLocation = [Int: ListNode?]()
    for i in 0 ..< nodes.count {
        var newIndex = i + k
        if newIndex >= nodes.count {
            newIndex = (i + k) - (((i + k) / nodes.count) * nodes.count)
        }
        newNodeLocation[newIndex] = nodes[i]
    }

    let newheadNode = newNodeLocation[0] as? ListNode
    currentNode = newheadNode
    for index in 1 ..< newNodeLocation.count {
        currentNode?.next = newNodeLocation[index] as? ListNode
        currentNode = currentNode?.next
        if index == (newNodeLocation.count - 1) {
            currentNode?.next = nil
        }
    }

    return newheadNode
}

let rootNode = createList(data: [1, 2, 3, 4, 5, 6])
let newNode = rotateRight(rootNode, 2)
getNodeValue(root: newNode)

let rootNode1 = createList(data: [])
getNodeValue(root: rootNode1)
let newNode1 = rotateRight(rootNode1, 0)
getNodeValue(root: newNode1)

let rootNode2 = createList(data: [1, 2, 3, 4, 5, 6])
let newNode2 = rotateRight(rootNode2, 0)
getNodeValue(root: newNode2)
