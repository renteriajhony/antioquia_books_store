import 'package:antioquia_bookstore/api/store_api.dart';
import 'package:antioquia_bookstore/models/book.dart';
import 'package:antioquia_bookstore/models/http/books_response.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> booksList = [];

  getBooks({String search = 'new'}) async {
    final resp = await StoreApi.httpGet(search);
    booksList = [...BooksResponse.fromMap(resp).books];
    notifyListeners();
  }
}
