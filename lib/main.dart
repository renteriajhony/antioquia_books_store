import 'package:antioquia_bookstore/antioquia_bookstore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  StoreApi storeApi = StoreApi();
  storeApi.configureDio();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => BooksProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: true);

    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: mainProvider.isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const InitialPage(),
    );
  }
}
