import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:antioquia_bookstore/ui/widgets/custom_search_bar.dart';

import '../../providers/books_provider.dart';
import 'books_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      child: Builder(builder: (context) {
        final booksProvider = Provider.of<BooksProvider>(context, listen: true);
        // booksProvider.getBooks();
        final booksList = booksProvider.booksList;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Libreria Antioquia'),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const CustomSearchBar(),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      booksList.isNotEmpty
                          ? const BooksPage()
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
