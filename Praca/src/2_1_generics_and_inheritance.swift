class Stack<T> {
    var stack: Array<T> = []
    func push(object: T) {
        stack.append(object)
    }
    func pop() -> T {
        return stack.removeLast()
    }
 }

 class PopManyStack<T> : Stack<T> {
    func popN(n: Int) -> [T] {
        let lastN = stack.suffix(n)
        stack.removeLast(n)
        return Array(lastN)
    }
 }
