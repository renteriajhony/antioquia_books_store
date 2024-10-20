import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/book.dart';
import '../../providers/books_provider.dart';
import '../widgets/book_info.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    Provider.of<BooksProvider>(context, listen: false)
        .getBookDetail(book.isbn13);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del libro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: book.isbn13,
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.black12,
                child: Image.network(book.image),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              maxLines: 3,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            const BookInfo(),
          ],
        ),
      ),
    );
  }
}
