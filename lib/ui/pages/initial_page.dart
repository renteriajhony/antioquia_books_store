import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../antioquia_bookstore.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: true);
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(UiLabelsApp.labelsApp['initialPage']['title']),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CustomSearchBar(
              mainProvider: mainProvider,
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  (booksProvider.isLoading && booksProvider.books.isEmpty)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : booksProvider.books.isEmpty
                          ? const Blank(
                              key: Key('blank_page'),
                            )
                          : const BooksPage()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
