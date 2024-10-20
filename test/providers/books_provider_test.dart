import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:antioquia_bookstore/antioquia_bookstore.dart';

import '../api/store_api_test.mocks.dart';
import 'books_provider_test.mocks.dart';

@GenerateMocks([StoreApi])
void main() {
  late BooksProvider booksProvider;
  late MockStoreApi mockStoreApi;
  late MockDio mockDio;
  late BaseOptions mockOptions;

  setUp(() {
    mockStoreApi = MockStoreApi();
    booksProvider = BooksProvider();
    mockDio = MockDio();
    mockOptions = BaseOptions();
    when(mockDio.options).thenReturn(mockOptions);
    mockStoreApi.configureDio(dio: mockDio);
  });

  group('BooksProvider', () {
    test('getBooks should fetch and update books', () async {
      // arrange
      const searchTerm = 'flutter';
      final booksResponse = BooksResponse(
        error: '0',
        total: '2',
        books: [
          Book(
            title: 'title',
            subtitle: 'subtitle',
            isbn13: 'isbn13',
            price: 'price',
            image: 'image',
            url: 'url',
          ),
          Book(
            title: 'title2',
            subtitle: 'subtitle2',
            isbn13: 'isbn132',
            price: 'price2',
            image: 'image2',
            url: 'url2',
          )
        ],
      );
      when(mockStoreApi.httpGet(any))
          .thenAnswer((_) async => booksResponse.toMap());

      // act
      await booksProvider.getBooks(search: searchTerm);

      // assert
      expect(booksProvider.isLoading, false);
      expect(booksProvider.hasMorePages, false);
    });

    test('getBooks should handle empty response', () async {
      // arrange
      const searchTerm = 'flutter';
      when(mockStoreApi.httpGet('search/$searchTerm/1'))
          .thenAnswer((_) async => {});

      // act
      await booksProvider.getBooks(search: searchTerm);

      // assert
      expect(booksProvider.isLoading, false);
      expect(booksProvider.books.isEmpty, true);
      expect(booksProvider.totalItems, 0);
      expect(booksProvider.hasMorePages, false);
    });

    test('getBooks should handle exceptions', () async {
      // arrange
      const searchTerm = 'flutter';
      when(mockStoreApi.httpGet('search/$searchTerm/1'))
          .thenThrow(Exception('Failed to fetch books'));

      // act
      await booksProvider.getBooks(search: searchTerm);

      // assert
      expect(booksProvider.isLoading, false);
      expect(booksProvider.books.isEmpty, true);
    });

    test('getBookDetail should fetch and update book details', () async {
      // arrange
      const isbn13 = '9781234567890';
      final bookDetailResponse = BookDetailResponse(
        error: '0',
        title: 'Flutter Development',
        subtitle: 'A Comprehensive Guide',
        authors: 'Author Name',
        publisher: 'Publisher Name',
        language: 'English',
        isbn10: '1234567890',
        isbn13: isbn13,
        pages: '500',
        year: '2023',
        rating: '4.5',
        desc: 'A comprehensive guide to Flutter development.',
        price: '\$39.99',
        image: 'https://example.com/flutter_book.jpg',
        url: 'https://example.com/flutter_book',
        pdf: {},
      );
      when(mockStoreApi.httpGet('books/$isbn13'))
          .thenAnswer((_) async => bookDetailResponse.toMap());

      // act
      await booksProvider.getBookDetail(isbn13);

      // assert
      expect(booksProvider.isLoading, false);
    });

    test('getBookDetail should handle exceptions', () async {
      // arrange
      const isbn13 = '9781234567890';
      when(mockStoreApi.httpGet('books/$isbn13'))
          .thenThrow(Exception('Failed to fetch book details'));

      // act
      await booksProvider.getBookDetail(isbn13);

      // assert
      expect(booksProvider.isLoading, false);
      expect(booksProvider.bookDetailResponse.isbn13, isbn13);
    });
  });
}
