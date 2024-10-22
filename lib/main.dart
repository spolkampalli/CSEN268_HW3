import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_club_app/cubit/book_cubit.dart';
import 'package:book_club_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Using Blocs for this homework
    return BlocProvider(
      create: (context) => BookCubit()..init(), 
      child: MaterialApp(
        title: 'Book Club App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(), 
      ),
    );
  }
}