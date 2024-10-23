import 'package:equatable/equatable.dart';
import 'package:book_club_app/models/book.dart';

// Enum to define different modes of sorting for the book list
enum SortingMode { byTitle, byAuthor }

// BookState class that extends Equatable to support value comparisons
class BookState extends Equatable {
  final List<Book> books;

  final SortingMode sortingMode;
  const BookState({required this.books, required this.sortingMode});

  @override
  List<Object> get props => [books, sortingMode];

  BookState copyWith({required List<Book> books, required SortingMode sortingMode}) {
    return BookState(
      books: books,
      sortingMode: sortingMode, 
    );
  }
}
