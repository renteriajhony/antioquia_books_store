import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import '../../providers/books_provider.dart';
import 'books_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      child: Builder(builder: (context) {
        final booksProvider = Provider.of<BooksProvider>(context);
        booksProvider.getBooks();
        final booksList = booksProvider.booksList;
        return Scaffold(
          body: Container(
            color: ThemeData.light(useMaterial3: true).canvasColor,
            child: booksList.isNotEmpty
                ? const BooksPage()
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      }),
    );
  }
}
