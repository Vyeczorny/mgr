typealias BigData = Int

class DataContainer {
   // zmienna tworzona leniwie, dopiero podczas jej pierwszego użycia
   lazy var bigData = BigData()

   // .. reszta ciała klasy
}

let container = DataContainer()
print(container.bigData) // obiekt bigData zostanie uwtorzony dopiero w tym momencie

// sekwencja liczb Fibbonacciego generowana leniwie
class Fibbonacci: LazySequenceProtocol {
    public func makeIterator() -> FibbonacciIterator {
        return FibbonacciIterator()
    }
}

// generator liczb Fibbonacciego
class FibbonacciIterator: IteratorProtocol {
    private var first = 0
    private var second = 1

    public func next() -> Int? {
        let next = first + second
        first = second
        second = next
        return next
    }
}

let evenFibbonacci = Fibbonacci().filter { $0 % 2 == 0 }
var iterator = evenFibbonacci.makeIterator()

for i in 1...5 {
    print(iterator.next()!)
}
