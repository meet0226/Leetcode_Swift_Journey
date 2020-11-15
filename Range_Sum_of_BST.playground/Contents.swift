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

func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root = root else { return 0 }
    var nodeArray: [TreeNode] = [root]
    var result = 0
    while !nodeArray.isEmpty {
        var newNodeArray = [TreeNode]()
        for node in nodeArray {
            result += (low...high).contains(node.val) ? node.val : 0
            if let leftNode = node.left, node.val >= low {
                newNodeArray.append(leftNode)
            }

            if let rightNode = node.right, node.val <= high {
                newNodeArray.append(rightNode)
            }
        }
        nodeArray = newNodeArray
    }
    return result
}

let root1 = createTreeNode(data: [10,5,15,3,7,nil,18])
print(rangeSumBST(root1, 7, 15))
