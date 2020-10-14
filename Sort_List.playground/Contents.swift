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

func sortList(_ head: ListNode?) -> ListNode? {
    var listNodes = [ListNode?]()
    var currentNode = head
    while currentNode != nil {
        listNodes.append(currentNode)
        currentNode = currentNode?.next
    }
    listNodes.sort { $0!.val < $1!.val }
    currentNode = listNodes.isEmpty ? nil : listNodes[0]
    let outputNode = currentNode
    var index = 1
    while currentNode != nil {
        currentNode?.next = index < listNodes.count ? listNodes[index] : nil
        currentNode = currentNode?.next
        index += 1
    }
    return outputNode
}

let rootNode = createList(data: [4,2,1,3])
getNodeValue(root: rootNode)
let outputNode = sortList(rootNode)
getNodeValue(root: outputNode)

let rootNode1 = createList(data: [-1,5,3,4,0])
getNodeValue(root: rootNode1)
let outputNode1 = sortList(rootNode1)
getNodeValue(root: outputNode1)

let rootNode2 = createList(data: [])
getNodeValue(root: rootNode2)
let outputNode2 = sortList(rootNode2)
getNodeValue(root: outputNode2)
