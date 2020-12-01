import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0; next = nil }
    public init(_ val: Int) { self.val = val; next = nil }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    guard head != nil, head?.next != nil else { return nil }
    var slowNode = head
    var fastNode = head
    while fastNode != nil {
        slowNode = slowNode?.next
        fastNode = fastNode!.next?.next

        if slowNode === fastNode {
            slowNode = head
            while slowNode !== fastNode {
                slowNode = slowNode?.next
                fastNode = fastNode?.next
            }
            return slowNode
        }
    }

    return nil
}
