import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:antioquia_bookstore/ui/widgets/custom_search_bar.dart';

import '../../providers/books_provider.dart';
import 'books_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksProvider = Provider.of<BooksProvider>(context, listen: true);
    return ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      lazy: false,
      child: Scaffold(
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
                    booksProvider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const BooksPage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
