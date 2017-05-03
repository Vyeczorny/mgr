// domknięcie przyjmujące dwa obiekty typu Int i zwracające obiekt typu Int
let addTwoInts: ((Int, Int) -> Int) = { (a, b) in a + b }

// wywołanie domknięcia przypisanego do zmiennej `addTwoInts`
let result = addTwoInts(5, 10)
