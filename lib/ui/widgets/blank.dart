import 'package:antioquia_bookstore/antioquia_bookstore.dart';
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
            flex: DimensionsIntApp.oneD,
            child: Image.asset(
              UiLabelsApp.labelsApp['BlankPage']['image'],
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: DimensionsDoubleApp.tenD,
          ),
          Text(
            UiLabelsApp.labelsApp['BlankPage']['title'],
            style: TextStyle(
                fontSize: DimensionsDoubleApp.twentyD,
                fontWeight: FontWeight.bold),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
