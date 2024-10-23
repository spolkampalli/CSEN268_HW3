import 'package:flutter/material.dart';
import 'package:book_club_app/models/book.dart';

// Book image widget that shows in details page
class BookDetailWidget extends StatelessWidget {
  final Book book;

  const BookDetailWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book image
          Image.network(
            book.imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.broken_image, size: 50);
            },
          ),
          const SizedBox(height: 10),
          // Book title
          Text(
            book.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // Book author
          Text(
            'by ${book.author}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          // Book description
          Text(
            book.description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}