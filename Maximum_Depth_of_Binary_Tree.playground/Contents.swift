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


func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let left = maxDepth(root.left)
    let right = maxDepth(root.right)
    return max(left, right) + 1
}

let root1 = createTreeNode(data: [3,9,20,nil,nil,15,7])
print(maxDepth(root1))
