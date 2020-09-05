
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

func addValuesInList(root: TreeNode?, values: inout [Int]) {
    guard let root = root else { return }
    addValuesInList(root: root.left, values: &values)
    values.append(root.val)
    addValuesInList(root: root.right, values: &values)
}

func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
    var output = [Int]()
    var list1 = [Int]()
    var list2 = [Int]()
    addValuesInList(root: root1, values: &list1)
    addValuesInList(root: root2, values: &list2)
    output = (list1 + list2).sorted  { $0 < $1 }
    return output
}

let root1 = createTreeNode(data: [2,1,4])
let root2 = createTreeNode(data: [5,1,7,0,2])
print(getAllElements(root1, root2))
