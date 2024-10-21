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
        padding: EdgeInsets.symmetric(
            horizontal: DimensionsDoubleApp.fiveD,
            vertical: DimensionsDoubleApp.fiveD),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionsDoubleApp.eightD),
          color: mainProvider.isDark ? Colors.white12 : Colors.black12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: book.isbn13,
              child: book.image
                      .contains(UiLabelsApp.labelsApp['BookCover']['http'])
                  ? Image.network(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      book.image,
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              width: DimensionsDoubleApp.oneHundredFiftyD,
              child: Text(
                book.title,
                maxLines: DimensionsIntApp.twoD,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: DimensionsDoubleApp.tenD,
                ),
              ),
            ),
            Text(
              '${UiLabelsApp.labelsApp['BookCover']['price']} ${book.price}',
              maxLines: DimensionsIntApp.oneD,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: DimensionsDoubleApp.tenD,
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
