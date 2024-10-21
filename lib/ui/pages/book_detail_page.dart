import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../antioquia_bookstore.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    Provider.of<BooksProvider>(context, listen: false)
        .getBookDetail(book.isbn13);

    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(UiLabelsApp.labelsApp['BookDetailPage']['title']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: DimensionsDoubleApp.twentyD,
            vertical: DimensionsDoubleApp.tenD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: book.isbn13,
              child: Container(
                width: double.infinity,
                height: DimensionsDoubleApp.threeHundredD,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(DimensionsDoubleApp.twentyD),
                  color: mainProvider.isDark
                      ? ColorsApp.coverDark
                      : ColorsApp.coverLigth,
                ),
                child: book.image.contains(
                        UiLabelsApp.labelsApp['BookDetailPage']['http'])
                    ? Image.network(book.image)
                    : const SizedBox(),
              ),
            ),
            SizedBox(height: DimensionsDoubleApp.twentyD),
            Text(
              book.title,
              maxLines: DimensionsIntApp.threeD,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: DimensionsDoubleApp.twentyFiveD,
              ),
            ),
            SizedBox(height: DimensionsDoubleApp.twentyD),
            Text(
              book.subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: DimensionsDoubleApp.twentyD,
              ),
            ),
            SizedBox(height: DimensionsDoubleApp.twentyD),
            const BookInfo(),
          ],
        ),
      ),
    );
  }
}
