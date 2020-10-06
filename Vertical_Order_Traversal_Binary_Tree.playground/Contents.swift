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



struct Node {
    var treeNode: TreeNode
    var position: (Int, Int)
}

func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [[Int]]() }
    var hashMap = [Int: [Node]]()

    var nodeArray: [Node] = [Node(treeNode: root, position: (0,0))]

    while nodeArray.count > 0 {
        var newNodeArray = [Node]()
        for i in 0..<nodeArray.count {
            let node = nodeArray[i]
            let (xPosition, yPosition) = node.position
            if hashMap[xPosition] == nil {
                hashMap[xPosition] = [node]
            } else {
                hashMap[xPosition]!.append(node)
            }

            if let leftNode = node.treeNode.left {
                let leftNewNode = Node(treeNode: leftNode,
                                       position: (xPosition - 1, yPosition + 1))
                newNodeArray.append(leftNewNode)
            }
            if let rightNode = node.treeNode.right {
                let rightNewNode = Node(treeNode: rightNode,
                                        position: (xPosition + 1, yPosition + 1))
                newNodeArray.append(rightNewNode)
            }
        }
        nodeArray = newNodeArray
    }

    let sortedKeys = Array(hashMap.keys).sorted()
    var output = [[Int]]()
    for key in sortedKeys {
        var nodeArray  = hashMap[key]!
        nodeArray.sort { (leftNode, rightNode) -> Bool in
            return (leftNode.position == rightNode.position && leftNode.treeNode.val < rightNode.treeNode.val)
        }
        let nodeValArray = nodeArray.map { $0.treeNode.val }
        output.append(nodeValArray)
    }
    return output
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

           //0,1,2,3,4  ,5,6  ,7  ,8  ,9  ,10,11,12,13,14 ,15 ,16 ,17
let input = [0,5,1,9,nil,2,nil,nil,nil,nil,3,4,8,6,nil,nil,nil,7]

let rootNode = createTreeNode(data: input)
getData(root: rootNode)
let output = verticalTraversal(rootNode) // [[9,7],[5,6],[0,2,4],[1,3],[8]]
print(output)

let input1 = [0,2,1,3,nil,nil,nil,4,5,nil,7,6,nil,10,8,11,9]
let rootNode1 = createTreeNode(data: input1)
getData(root: rootNode1)
let output1 = verticalTraversal(rootNode1) // [[4, 10, 11], [3, 6, 7], [2, 5, 8, 9], [0], [1]]
print(output1)
