#import <Foundation/Foundation.h>

// Definicja typu Book
@interface Book: NSObject
@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *author;
@property (copy, nonatomic, readonly) NSNumber *numPages;
- (instancetype)initWithTitle:(NSString *)title author:(NSString *)author
  numPages:(NSNumber *)numPages;
@end

@implementation Book
- (instancetype)initWithTitle:(NSString *)title author:(NSString *)author
  numPages:(NSNumber *)numPages {
    if (self = [super init]) {
        _title = title;
        _author = author;
        _numPages = numPages;
    }
    return self;
}
@end

// Definicja interfejsu BookPrinter
@protocol BookPrinter
- (void)printBook:(Book *)user;
@end

// Definicja klasy ConsoleBookPrinter implementującego protokół BookPrinter
@interface ConsoleBookPrinter: NSObject <BookPrinter>
@end

@implementation ConsoleBookPrinter
- (void)printBook:(Book *)book {
    NSLog(@"------------------------------");
    NSLog(@"> Tytul: %@", book.title);
    NSLog(@"> Autor: %@", book.author);
    NSLog(@"> Ilosc stron: %@", book.numPages);
    NSLog(@"------------------------------");
}
@end

int main (int argc, const char * argv[])
{
    Book* book = [[Book alloc] initWithTitle: @"Sztuka programowania"
                                      author: @"Donald Knuth"
                                    numPages: @(2338)];
    id<BookPrinter> printer = [ConsoleBookPrinter new];
    [printer printBook: book];
    return 0;
}
