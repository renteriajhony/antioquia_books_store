import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../antioquia_bookstore.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: true);
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Libreria Antioquia'),
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
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        )
                      : booksProvider.books.isEmpty
                          ? Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.topCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/nada2.png',
                                    width: double.infinity,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'No se encontraron libros',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
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
