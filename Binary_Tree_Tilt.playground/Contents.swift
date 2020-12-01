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

func findTilt(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var tilt = 0
    calculateTilt(root: root, tilt: &tilt)
    return tilt
}

func calculateTilt(root: TreeNode?, tilt: inout Int) -> Int {
    guard let root = root else { return 0 }
    let leftTilt = calculateTilt(root: root.left, tilt: &tilt)
    let rightTilt = calculateTilt(root: root.right, tilt: &tilt)
    tilt += abs(leftTilt - rightTilt)
    return leftTilt + rightTilt + root.val
}

let root = createTreeNode(data: [4, 2, 9, 3, 5, nil, 7])
// getData(root: root)
print(findTilt(root))

let root1 = createTreeNode(data: [21, 7, 14, 1, 1, 2, 2, 3, 3])
////getData(root: root1)
print(findTilt(root1))
