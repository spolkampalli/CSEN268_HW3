import 'package:flutter/material.dart';

// Widget for the author and title chips that sort the book images
class BookSortingWidget extends StatelessWidget {
  final BuildContext context;
  final String label;
  final bool isActive;
  final VoidCallback onPressed;

  const BookSortingWidget(
      {super.key,
      required this.context,
      required this.label,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom( // Style of widget changes to show if it is active or not
          backgroundColor: isActive ? const Color(0xFFFEF7FF) : Colors.white,
          foregroundColor: Colors.grey,
          side: const BorderSide(color: Color(0xFFCAC4D0), width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}