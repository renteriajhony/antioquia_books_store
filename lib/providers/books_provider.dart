import 'dart:developer';

import 'package:antioquia_bookstore/antioquia_bookstore.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  BooksResponse? _booksResponse;
  late BookDetailResponse _bookDetailResponse;
  List<Book> _books = [];
  bool _isLoading = false;
  int _currentPage = 1;
  String _currentSearch = ConstantApp.baseSearch;
  int _total = 0;

  List<Book> get books => _books;
  bool get isLoading => _isLoading;
  bool get hasMorePages => _books.length < _total;
  int get totalItems => int.parse(_booksResponse?.total ?? '0');
  BookDetailResponse get bookDetailResponse => _bookDetailResponse;

  final ScrollController scrollController = ScrollController();

  BooksProvider() {
    scrollController.addListener(_scrollListener);
    getBooks();
  }

  Future<void> getBooks({String search = ConstantApp.baseSearch}) async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();

    if (search != _currentSearch) {
      _books = [];
      _currentSearch = search;
      _currentPage = 1;
    }

    String path = (search == '' || search == ConstantApp.baseSearch)
        ? ConstantApp.baseSearch
        : '${ConstantApp.apiTag}/$search/$_currentPage';

    try {
      final resp = await StoreApi().httpGet(path);
      _booksResponse = BooksResponse.fromMap(resp);
      _total = totalItems;
      if (_total > 0) {
        _books.addAll(_booksResponse?.books ?? []);
        _currentPage++;
      }
    } catch (e) {
      _books = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getBookDetail(String isbn13) async {
    _isLoading = true;

    String path = 'books/$isbn13';
    _bookDetailResponse = BookDetailResponse(isbn13: isbn13);
    try {
      final resp = await StoreApi().httpGet(path);
      _bookDetailResponse = BookDetailResponse.fromMap(resp);
    } catch (e) {
      log(e.toString(), name: 'getBookDetail Error');
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
