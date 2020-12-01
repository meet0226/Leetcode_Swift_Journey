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
        // print(root?.val)
        getData(root: root?.right)
        print(root?.val)
    }
}

func maxAncestorDiff(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var result = 0
    calculateDifference(root, root.val, root.val, &result)
    return result
}

func calculateDifference(_ node: TreeNode?, _ currentMax: Int, _ currentMin: Int, _ result: inout Int) {
    guard let node = node else { return }
    let possibleResult = max(abs(currentMax - node.val), abs(currentMin - node.val))
    result = max(result, possibleResult)
    let currentMax = max(currentMax, node.val)
    let currentMin = min(currentMin, node.val)
    calculateDifference(node.left, currentMax, currentMin, &result)
    calculateDifference(node.right, currentMax, currentMin, &result)
}

let root = createTreeNode(data: [8, 3, 10, 1, 6, nil, 14, nil, nil, 4, 7, 13])
getData(root: root)
print(maxAncestorDiff(root))
