import 'package:flutter/material.dart';
import 'package:book_club_app/pages/details_page.dart';
import 'package:book_club_app/widgets/book_image_widget.dart';
import 'package:book_club_app/widgets/book_sorting_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_club_app/cubit/book_cubit.dart';
import 'package:book_club_app/cubit/book_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Club App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BlocBuilder to build sorting widgets based on state
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Sort by',
                          style: TextStyle(color: Colors.black)),
                    ),
                    // Sort by Author (Author should be active at the start)
                    BookSortingWidget(
                      context: context,
                      label: 'Author',
                      isActive: state.sortingMode == SortingMode.byAuthor,
                      onPressed: () => context.read<BookCubit>().sortByAuthor(),
                    ),
                    const SizedBox(width: 8),
                    // Sort by Title
                    BookSortingWidget(
                      context: context,
                      label: 'Title',
                      isActive: state.sortingMode == SortingMode.byTitle,
                      onPressed: () => context.read<BookCubit>().sortByTitle(),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Books',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: BlocBuilder<BookCubit, BookState>(
                      builder: (context, state) {
                        // If no books available, show a message
                        if (state.books.isEmpty) {
                          return const Center(child: Text('No books available.'));
                        }
                        // Display list of books
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.books.length,
                          itemBuilder: (context, index) {
                            final book = state.books[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              child: GestureDetector(
                                onTap: () { // Navigate to details page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookDetailPage(book: book),
                                    ),
                                  );
                                },
                                child: BookImageWidget(book: book),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
