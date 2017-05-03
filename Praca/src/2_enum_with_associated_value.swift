indirect enum Tree<Value> {
    case Empty
    case Node(Tree<Value>, Value, Tree<Value>)
}

let intTree = Tree.Node(
    .Node(.Empty, 1, .Empty),
    2,
    .Empty
)
