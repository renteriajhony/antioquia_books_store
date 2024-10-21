import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../antioquia_bookstore.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: DimensionsDoubleApp.twelveD,
            vertical: DimensionsDoubleApp.tenD),
        child: GridView.builder(
          controller: booksProvider.scrollController,
          itemCount: booksProvider.books.length +
              (booksProvider.hasMorePages
                  ? DimensionsIntApp.oneD
                  : DimensionsIntApp.ceroD),
          itemBuilder: (context, index) {
            if (index == booksProvider.books.length ||
                (booksProvider.isLoading && booksProvider.books.isEmpty)) {
              return const Center(child: CircularProgressIndicator());
            }
            return BookCover(book: booksProvider.books[index]);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: DimensionsIntApp.threeD,
            childAspectRatio: DimensionsIntApp.twoD / DimensionsIntApp.threeD,
            crossAxisSpacing: DimensionsDoubleApp.tenD,
            mainAxisSpacing: DimensionsDoubleApp.tenD,
          ),
        ),
      ),
    );
  }
}
