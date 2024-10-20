import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../antioquia_bookstore.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    required this.book,
    super.key,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: true);
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: mainProvider.isDark ? Colors.white12 : Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: book.isbn13,
              child: book.image.contains('http')
                  ? Image.network(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      book.image,
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              width: 150,
              child: Text(
                book.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            Text(
              'Precio: ${book.price}',
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailPage(book: book)));
      },
    );
  }
}
