import 'package:antioquia_bookstore/api/store_api.dart';
import 'package:antioquia_bookstore/models/book.dart';
import 'package:antioquia_bookstore/models/http/books_response.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  BooksResponse? _booksResponse;
  List<Book> _books = [];
  bool _isLoading = false;
  int _currentPage = 1;
  String _currentSearch = 'new';
  int _total = 0;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;
  bool get hasMorePages => _books.length < _total;
  int get totalItems => int.parse(_booksResponse?.total ?? '0');

  final ScrollController scrollController = ScrollController();

  BooksProvider() {
    scrollController.addListener(_scrollListener);
    getBooks();
  }

  Future<void> getBooks({String search = 'new'}) async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    if (search != _currentSearch) {
      _books = [];
      _currentSearch = search;
      _currentPage = 1;
    }

    String path = (search == '' || search == 'new')
        ? 'new'
        : 'search/$search/$_currentPage';

    try {
      final resp = await StoreApi.httpGet(path);
      _booksResponse = BooksResponse.fromMap(resp);
      _total = totalItems;
      if (_total == 0) {
        // _books.addAll(_booksResponse?.books ?? []);
      } else {
        _books.addAll(_booksResponse?.books ?? []);
        _currentPage++;
      }
    } catch (e) {
      _books = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void _scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        hasMorePages) {
      getBooks(search: _currentSearch);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
