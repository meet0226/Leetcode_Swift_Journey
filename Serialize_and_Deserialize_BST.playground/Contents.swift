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


class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        var nodeArrayValues = [String]()
        getSerializedString(root, &nodeArrayValues)
        return nodeArrayValues.joined(separator: ",")
    }

    func getSerializedString(_ root: TreeNode?, _ nodeArrayValues: inout [String]) {
        guard let root = root else { return }
        nodeArrayValues.append("\(root.val)")
        getSerializedString(root.left, &nodeArrayValues)
        getSerializedString(root.right, &nodeArrayValues)
    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        guard !data.isEmpty else { return nil }
        let arr = data.components(separatedBy:",")
        var index = 0
        return deserializeTreeNode(arr, &index, Int.min, Int.max)
    }

    func deserializeTreeNode(_ arr: [String], _ index: inout Int, _ minVal: Int, _ maxVal: Int) -> TreeNode? {
        guard index < arr.count, let val = Int(arr[index]) else{
            return nil
        }

        if val < minVal || val > maxVal{
            return nil
        }

        let node = TreeNode(val)
        index += 1

        node.left = deserializeTreeNode(arr, &index, minVal, val)
        node.right = deserializeTreeNode(arr, &index, val, maxVal)

        return node
    }
}

func getData(root: TreeNode?) {
    if root != nil {
        getData(root: root?.left)
        print(root?.val)
        getData(root: root?.right)
    }
}

let root = createTreeNode(data: [2,1,3,4,5,6,7,8,9,2,4,nil,5])
getData(root: root)

let codec = Codec()
let serializedString = codec.serialize(root)
let deserializedNode = codec.deserialize(serializedString)
print("Now")
getData(root: deserializedNode)

let root1 = createTreeNode(data: [5,3,6,2,4,nil,nil,1])
getData(root: root1)

let codec1 = Codec()
let serializedString1 = codec1.serialize(root1)
let deserializedNode1 = codec1.deserialize(serializedString1)
print("Now")
getData(root: deserializedNode1)
