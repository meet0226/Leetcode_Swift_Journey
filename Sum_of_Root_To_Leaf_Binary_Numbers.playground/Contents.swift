
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

func addValuesInList(root: TreeNode?, string: inout String, sum: inout Int) {
    guard let root = root else { return }
    string.append(String(root.val))
    if root.left == nil, root.right == nil {
        sum += Int(string, radix: 2)!
        string.removeLast()
    }
    if root.left != nil {
        addValuesInList(root: root.left, string: &string, sum: &sum)
        if string.count > 1, root.right == nil { string.removeLast() }
    }
    if root.right != nil {
        addValuesInList(root: root.right, string: &string, sum: &sum)
        if string.count > 1 { string.removeLast() }
    }
}

func sumRootToLeaf(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var sum = 0, string = String()
    addValuesInList(root: root, string: &string, sum: &sum)
    return sum
}

let input = [1, 0, 1, 0, 1, 0, 1]
let treeNode = createTreeNode(data: input)
print(sumRootToLeaf(treeNode))
