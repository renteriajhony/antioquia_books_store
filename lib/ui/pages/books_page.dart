import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/books_provider.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Page'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: Text(
            'Books ${booksProvider.booksList.length}',
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
