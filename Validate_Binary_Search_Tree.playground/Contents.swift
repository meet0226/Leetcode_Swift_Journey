import UIKit

class TreeNode {
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

func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    var values = [Int]()
    var validBST = true
    inorderTraverse(root: root, values: &values, validBST: &validBST)
    return validBST
}

func inorderTraverse(root: TreeNode?, values: inout [Int], validBST: inout Bool) {
    if root != nil {
        inorderTraverse(root: root?.left, values: &values, validBST: &validBST)
        if let lastValue = values.last,
            let currentValue = root?.val,
            lastValue >= currentValue {
            validBST = false
        }
        values.append(root!.val)
        inorderTraverse(root: root?.right, values: &values, validBST: &validBST)
    }
}

let root = createTreeNode(data: [2,1,4])
print(isValidBST(root))

let root1 = createTreeNode(data: [5,1,4,nil,nil,3,6])
print(isValidBST(root1))

let root2 = createTreeNode(data: [5,1,6,nil,nil,3,7])
print(isValidBST(root2))

let root3 = createTreeNode(data: [4,2,6,nil,1,5,7])
print(isValidBST(root3))

let root4 = createTreeNode(data: [])
print(isValidBST(root4))

let root5 = createTreeNode(data: [1,1])
print(isValidBST(root5))


