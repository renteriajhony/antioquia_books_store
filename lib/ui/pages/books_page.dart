import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/books_provider.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: Stack(
        children: [
          ListView.builder(
            controller: booksProvider.scrollController,
            itemCount: booksProvider.books.length +
                (booksProvider.hasMorePages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == booksProvider.books.length ||
                  (booksProvider.isLoading && booksProvider.books.isEmpty)) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListTile(
                title: Text(booksProvider.books[index].title),
                subtitle: Text(booksProvider.books[index].subtitle),
                leading: Image.network(booksProvider.books[index].image),
                isThreeLine: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
