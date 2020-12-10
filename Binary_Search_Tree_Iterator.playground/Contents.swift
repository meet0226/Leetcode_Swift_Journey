import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func createTreeNode(data: [Int?]) -> TreeNode? {
    var root: TreeNode?
    guard !data.isEmpty else { return root }
    var index = 1
    var nodeArray = [TreeNode]()
    if let firstValue = data[0] {
        root = TreeNode(firstValue)
        nodeArray.append(root!)
    }
    while index < data.count {
        var newNodeArray = [TreeNode]()
        for i in 0 ..< nodeArray.count {
            let node = nodeArray[i]
            if index < data.count,
               let value = data[index]
            {
                let newNode = TreeNode(value)
                node.left = newNode
                newNodeArray.append(newNode)
            }
            index += 1
            if index < data.count, let value = data[index] {
                let newNode = TreeNode(value)
                node.right = newNode
                newNodeArray.append(newNode)
            }
            index += 1
        }
        nodeArray = newNodeArray
    }
    return root
}

class BSTIterator {

    private class BSTIteratorNode {
        public var val: Int
        public var next: BSTIteratorNode?
        public var hasNext: Bool

        public init(_ val: Int, _ next: BSTIteratorNode?, _ hasNext: Bool) {
            self.val = val
            self.next = next
            self.hasNext = hasNext
        }
    }

    private var rootBSTIteratorNode = BSTIteratorNode(-1, nil, false)
    private var currentNode: BSTIteratorNode?


    init(_ root: TreeNode?) {
        currentNode = rootBSTIteratorNode
        traverse(root: root)
        currentNode = rootBSTIteratorNode
        getData(root: rootBSTIteratorNode)
    }

    private func getData(root: BSTIteratorNode?) {
        if root != nil {
            print(root?.val)
            print(root?.hasNext)
            getData(root: root?.next)
        }
    }

    func traverse(root: TreeNode?) {
        if root != nil {
            traverse(root: root?.left)
            currentNode?.next = BSTIteratorNode(root!.val, nil, false)
            currentNode?.hasNext = true
            currentNode = currentNode?.next
            traverse(root: root?.right)
        }
    }


    func next() -> Int {
        currentNode = currentNode?.next
        return currentNode!.val
    }

    func hasNext() -> Bool {
        return currentNode!.hasNext
    }
}


let root = createTreeNode(data: [7, 3, 15, nil, nil, 9, 20])
let obj = BSTIterator(root)
print(obj.next())
print(obj.next())
print(obj.hasNext())
print(obj.next())
print(obj.hasNext())
print(obj.next())
print(obj.hasNext())
print(obj.next())
print(obj.hasNext())
