struct Book {
    let title: String
    let author: String
    let numPages: Int
}

protocol BookPrinter {
    func printBook(_ book: Book)
}

class ConsoleBookPrinter: BookPrinter {
    func printBook(_ book: Book) {
        print("------------------------------");
        print("> Tytul: \(book.title)");
        print("> Autor: \(book.author)");
        print("> Ilosc stron: \(book.numPages)");
        print("------------------------------");
    }
}

let book = Book(title: "Sztuka programowania", author: "Donald Knuth", numPages: 2338)
let printer: BookPrinter = ConsoleBookPrinter()
printer.printBook(book)
