import UIKit

class TreeNode {
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var output = [[Int]]()
    guard let root = root else { return output }
    var nodeArray: [TreeNode] = [root]
    output.append([root.val])
    var index = 1
    while nodeArray.count > 0 {
        var newNodeArray = [TreeNode]()
        for i in 0 ..< nodeArray.count {
            let node = nodeArray[i]
            if let leftNode = node.left {
                if index == output.count {
                    output.append([leftNode.val])
                } else {
                    output[index].append(leftNode.val)
                }
                newNodeArray.append(leftNode)
            }
            if let rightNode = node.right {
                if index == output.count {
                    output.append([rightNode.val])
                } else {
                    output[index].append(rightNode.val)
                }
                newNodeArray.append(rightNode)
            }
        }
        index += 1
        nodeArray = newNodeArray
    }

    return output
}

let input = [3, 9, 20, nil, nil, 15, 7]
let treeNode = createTreeNode(data: input)
print(levelOrder(treeNode)) // [[3], [9, 20], [15, 7]]
