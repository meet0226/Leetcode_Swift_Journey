import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func getData(root: TreeNode?) {
    if root != nil {
        getData(root: root?.left)
        print(root?.val)
        getData(root: root?.right)
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
        for i in 0..<nodeArray.count {
            let node = nodeArray[i]
            if index < data.count,
                let value = data[index] {
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

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var output = 1
    var nodeArray: [TreeNode?] = [root]
    while !nodeArray.isEmpty {
        var tempNode = [TreeNode?]()
        for node in nodeArray {
            if node?.left == nil && node?.right == nil { return output }

            if let leftNode = node?.left {
                tempNode.append(leftNode)
            }
            if let rightNode = node?.right {
                tempNode.append(rightNode)
            }
        }
        output += 1
        nodeArray = tempNode
    }
    return 0
}

let treeNode = createTreeNode(data: [3,9,20,nil,nil,15,7])
getData(root: treeNode)
print(minDepth(treeNode))

let treeNode1 = createTreeNode(data: [2,nil,3,nil,4,nil,5,nil,6])
getData(root: treeNode1)
print(minDepth(treeNode1))

let treeNode2 = createTreeNode(data: [1,2,3,4,5])
getData(root: treeNode2)
print(minDepth(treeNode2))
