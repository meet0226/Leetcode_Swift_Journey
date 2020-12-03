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

func getData(root: TreeNode?) {
    if root != nil {
        getData(root: root?.left)
        print(root?.val)
        getData(root: root?.right)
    }
}


func increasingBST(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    let outputRoot = TreeNode()
    var currentNode: TreeNode? = outputRoot
    createIncreasingBST(root: root, &currentNode)
    return outputRoot.right
}

func createIncreasingBST(root: TreeNode?, _ currentNode: inout TreeNode?) {
    if root != nil {
        createIncreasingBST(root: root?.left, &currentNode)
        currentNode?.right = TreeNode(root!.val)
        currentNode?.left = nil
        currentNode = currentNode?.right
        createIncreasingBST(root: root?.right, &currentNode)
    }
}

let root1 = createTreeNode(data: [5,3,6,2,4,nil,8,1,nil,nil,nil,7,9])
getData(root: root1)

let increasingRoot = increasingBST(root1)
getData(root: increasingRoot)
