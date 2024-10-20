import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/books_provider.dart';
import '../widgets/book_cover.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: GridView.builder(
          controller: booksProvider.scrollController,
          itemCount:
              booksProvider.books.length + (booksProvider.hasMorePages ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == booksProvider.books.length ||
                (booksProvider.isLoading && booksProvider.books.isEmpty)) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            }
            return BookCover(book: booksProvider.books[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
