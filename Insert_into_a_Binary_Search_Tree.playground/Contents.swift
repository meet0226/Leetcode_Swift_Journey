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

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let newRoot = root else { return TreeNode(val) }
    if val < newRoot.val {
        newRoot.left = insertIntoBST(root?.left, val)
    } else {
        newRoot.right = insertIntoBST(root?.right, val)
    }
    return newRoot
}

func getData(root: TreeNode?) {
    if root != nil {
        getData(root: root?.left)
        print(root?.val)
        getData(root: root?.right)
    }
}

let input = [4,2,7,1,3]
let treeNode = createTreeNode(data: input)
let newTreeNode = insertIntoBST(treeNode, 5)
getData(root: newTreeNode)

let input1 = [40,20,60,10,30,50,70]
let treeNode1 = createTreeNode(data: input1)
let newTreeNode1 = insertIntoBST(treeNode1, 25)
getData(root: newTreeNode1)

let input2: [Int?] = []
let treeNode2 = createTreeNode(data: input2)
let newTreeNode2 = insertIntoBST(treeNode2, 5)
getData(root: newTreeNode2)
