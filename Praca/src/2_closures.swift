let sum = { (x: Int) in
    return { (y: Int) in
        return x + y
    }
}

let sum5 = sum(5)
let _5sum4 = sum5(4)