import 'package:flutter/material.dart';
import 'package:book_club_app/models/book.dart';

// Book image widget that shows in the horizontal scroll view
class BookImageWidget extends StatelessWidget {
  final Book book;

  const BookImageWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125, // Pre-set width 
      child: Image.network(
        book.imageUrl,
        fit: BoxFit.cover, // Ensures images covers the full width
        errorBuilder: (context, error, stackTrace) { // Returns an icon if the image does not load
          return const Icon(Icons.broken_image, size: 50); 
        },
      ),
    );
  }
}