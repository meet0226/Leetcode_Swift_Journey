
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

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    var output = 0
    guard let root = root else { return output }
    var nodeArray: [TreeNode] = [root]
    while nodeArray.count > 0 {
        var newNodeArray = [TreeNode]()
        for i in 0 ..< nodeArray.count {
            let node = nodeArray[i]
            if let leftNode = node.left {
                if leftNode.left == nil, leftNode.right == nil {
                    output += leftNode.val
                } else {
                    newNodeArray.append(leftNode)
                }
            }
            if let rightNode = node.right {
                newNodeArray.append(rightNode)
            }
        }
        nodeArray = newNodeArray
    }
    return output
}

let input = [3, 9, 20, nil, nil, 15, 7]
let treeNode = createTreeNode(data: input)
print(sumOfLeftLeaves(treeNode)) // 24

let input1 = [0, 5, 1, 9, nil, 2, nil, nil, nil, nil, 3, 4, 8, 6, nil, nil, nil, 7]
let treeNode1 = createTreeNode(data: input1)
print(sumOfLeftLeaves(treeNode1)) // 16
