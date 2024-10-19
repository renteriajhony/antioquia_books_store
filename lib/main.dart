import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:antioquia_bookstore/api/store_api.dart';

import 'providers/books_provider.dart';
import 'ui/pages/initial_page.dart';

void main() {
  StoreApi.configureDio();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => BooksProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const InitialPage(),
    );
  }
}
