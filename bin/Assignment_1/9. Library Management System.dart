class Book {
  String id;
  String title;
  String author;
  bool isAvailable;

  Book({required this.id, required this.title, required this.author, this.isAvailable = true});
}

class Library {
  Map<String, Book> _books = {};

  void addBook(Book book) {
    _books[book.id] = book;
  }

  void borrowBook(String bookId) {
    if (_books.containsKey(bookId)) {
      if (_books[bookId]!.isAvailable) {
        _books[bookId]!.isAvailable = false;
        print('Book borrowed successfully.');
      } else {
        throw Exception('Book is not available.');
      }
    } else {
      throw Exception('Book not found.');
    }
  }

  void returnBook(String bookId) {
    if (_books.containsKey(bookId)) {
      _books[bookId]!.isAvailable = true;
      print('Book returned successfully.');
    } else {
      throw Exception('Book not found.');
    }
  }

  List<Book> listAvailableBooks() {
    return _books.values.where((book) => book.isAvailable).toList();
  }

  List<Book> searchBooks(String query) {
    return _books.values
        .where((book) =>
    book.title.toLowerCase().contains(query.toLowerCase()) ||
        book.author.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

void main() {
  Library library = Library();

  // Add some sample books
  library.addBook(Book(id: '1', title: 'The Lord of the Rings', author: 'J.R.R. Tolkien'));
  library.addBook(Book(id: '2', title: 'To Kill a Mockingbird', author: 'Harper Lee'));
  library.addBook(Book(id: '3', title: '1984', author: 'George Orwell'));

  // Borrow a book
  try {
    library.borrowBook('1');
  } catch (e) {
    print('Error: $e');
  }

  // List available books
  print('Available books:');
  for (var book in library.listAvailableBooks()) {
    print('${book.title} by ${book.author}');
  }

  // Search for books
  print('\nBooks found:');
  for (var book in library.searchBooks('lord')) {
    print('${book.title} by ${book.author}');
  }
}