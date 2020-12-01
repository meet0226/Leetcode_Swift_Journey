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

func isEvenOddTree(_ root: TreeNode?) -> Bool {
    var output = [[Int]]()
    guard let root = root, (root.val % 2) != 0 else { return false }
    var nodeArray: [TreeNode] = [root]
    output.append([root.val])
    var index = 1
    while nodeArray.count > 0 {
        var newNodeArray = [TreeNode]()
        for i in 0 ..< nodeArray.count {
            let node = nodeArray[i]
            if let leftNode = node.left {
                if index == output.count {
                    if (index % 2) == 0, (leftNode.val % 2) == 0 {
                        return false
                    } else if (index % 2) != 0, (leftNode.val % 2) != 0 {
                        return false
                    }
                    output.append([leftNode.val])
                } else if !checkIncreasingDecreasingOrder(index, output[index], leftNode.val) {
                    return false
                } else {
                    output[index].append(leftNode.val)
                }
                newNodeArray.append(leftNode)
            }
            if let rightNode = node.right {
                if index == output.count {
                    if (index % 2) == 0, (rightNode.val % 2) == 0 {
                        return false
                    } else if (index % 2) != 0, (rightNode.val % 2) != 0 {
                        return false
                    }
                    output.append([rightNode.val])
                } else if !checkIncreasingDecreasingOrder(index, output[index], rightNode.val) {
                    return false
                } else {
                    output[index].append(rightNode.val)
                }
                newNodeArray.append(rightNode)
            }
        }
        index += 1
        nodeArray = newNodeArray
    }
    return true
}

func checkIncreasingDecreasingOrder(_ index: Int, _ existingArray: [Int], _ newValue: Int) -> Bool {
    if (index % 2) == 0, existingArray.last! >= newValue || (newValue % 2) == 0 {
        return false
    } else if (index % 2) != 0, existingArray.last! <= newValue || (newValue % 2) != 0 {
        return false
    }
    return true
}

let input = [3, 9, 20, 8, 10, 15, 7]
let treeNode = createTreeNode(data: input)
print(isEvenOddTree(treeNode))

let input2 = [1, 10, 4, 3, nil, 7, 9, 12, 8, 6, nil, nil, 2]
let treeNode2 = createTreeNode(data: input2)
print(isEvenOddTree(treeNode2))

let input3 = [5, 4, 2, 3, 3, 7]
let treenode3 = createTreeNode(data: input3)
print(isEvenOddTree(treenode3))

let input4 = [5, 9, 1, 3, 5, 7]
let treenode4 = createTreeNode(data: input4)
print(isEvenOddTree(treenode4))

let input5 = [11, 8, 6, 1, 3, 9, 11, 30, 20, 18, 16, 12, 10, 4, 2, 17]
let treenode5 = createTreeNode(data: input5)
print(isEvenOddTree(treenode5))

let input6 = [1]
let treenode6 = createTreeNode(data: input6)
print(isEvenOddTree(treenode6))

let input7 = [2, 12, 8, 5, 9, nil, nil, 18, 16]
let treenode7 = createTreeNode(data: input7)
print(isEvenOddTree(treenode7))

let input8 = [11, 18, 14, 3, 7, nil, nil, nil, nil, 18, nil, 6]
let treenode8 = createTreeNode(data: input8)
print(isEvenOddTree(treenode8))
