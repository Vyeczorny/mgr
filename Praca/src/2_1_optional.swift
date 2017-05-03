// Implementacja typu Optional z biblioteki standardowej
public enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}

// Monada Maybe w Haskellu
// data Maybe a = Nothing | Just a

struct Address {
    let city: String? // String? to cukier syntaktyczny dla typu Optional<String>
    let postalCode: String?
}

struct User {
    let name: String
    let address: Address?
}

let sampleUser: User? = User(
    name: "Jan Kowalski",
    address: Address(city: "Wrocław", postalCode: "50-500")
)
// Przykład użycia optional chaining - stała city ma typ Optional<String>
let city = sampleUser?.address?.city
