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

func getDecimalValue(_ head: ListNode?) -> Int {
    var binaryString = ""
    createBinaryString(head: head, binaryString: &binaryString)
    return Int(binaryString, radix: 2) ?? 0
}

func createBinaryString(head: ListNode?, binaryString: inout String) {
    if head != nil {
        binaryString.append(String(head!.val))
        createBinaryString(head: head?.next, binaryString: &binaryString)
    }
}

let rootNode = createList(data: [1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0])
print(getDecimalValue(rootNode))

let rootNode1 = createList(data: [1])
print(getDecimalValue(rootNode1))

let rootNode2 = createList(data: [0])
print(getDecimalValue(rootNode2))

let rootNode3 = createList(data: [0, 0])
print(getDecimalValue(rootNode3))

let rootNode4 = createList(data: [1, 0, 1])
print(getDecimalValue(rootNode4))
