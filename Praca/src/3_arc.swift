class Property {
    let address: String
    let price: Int
    
    init(address: String, price: Int) {
        self.address = address
        self.price = price
    }
}

class Owner {
    let name: String
    var ownedProperty: Property?
    
    init(name: String) {
        self.name = name
    }
}

func test() {
    var property: Property? = Property(address: "Rynek 1", price: 1000000)
    var owner: Owner? = Owner(name: "Jan Kowalski")
    owner?.ownedProperty = property
    property = nil
    print(owner!.ownedProperty!.address)
}
