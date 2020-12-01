import UIKit

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
        next = nil
    }
}

func createTreeNode(data: [Int?]) -> Node? {
    var root: Node?
    guard !data.isEmpty else { return root }
    var index = 1
    var nodeArray = [Node]()
    if let firstValue = data[0] {
        root = Node(firstValue)
        nodeArray.append(root!)
    }
    while index < data.count {
        var newNodeArray = [Node]()
        for i in 0 ..< nodeArray.count {
            let node = nodeArray[i]
            if index < data.count,
               let value = data[index]
            {
                let newNode = Node(value)
                node.left = newNode
                newNodeArray.append(newNode)
            }
            index += 1
            if index < data.count, let value = data[index] {
                let newNode = Node(value)
                node.right = newNode
                newNodeArray.append(newNode)
            }
            index += 1
        }
        nodeArray = newNodeArray
    }
    return root
}

func connect(_ root: Node?) -> Node? {
    guard let root = root else { return nil }
    root.next = nil
    var nodeArray: [Node] = [root]
    while !nodeArray.isEmpty {
        var newNodeArray = [Node]()
        var connectedNode: Node?
        for node in nodeArray {
            if let leftNode = node.left {
                if connectedNode == nil {
                    connectedNode = leftNode
                } else {
                    connectedNode?.next = leftNode
                    connectedNode = leftNode
                }
                newNodeArray.append(leftNode)
            }

            if let rightNode = node.right {
                if connectedNode == nil {
                    connectedNode = rightNode
                } else {
                    connectedNode?.next = rightNode
                    connectedNode = rightNode
                }
                newNodeArray.append(rightNode)
            }
        }
        connectedNode?.next = nil
        nodeArray = newNodeArray
    }
    return nil
}

let root = createTreeNode(data: [1, 2, 3, 4, 5, 6, 7])
let connectedNode = connect(root)
