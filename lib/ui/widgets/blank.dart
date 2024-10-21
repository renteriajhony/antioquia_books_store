import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  const Blank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/nada2.png',
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'No se encontraron libros',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
