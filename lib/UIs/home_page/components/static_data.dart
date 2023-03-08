import 'package:flutter/material.dart';

class StaticData extends StatelessWidget {
  const StaticData(this.label, this.data, {super.key});
  final String label;
  final int data;

  @override
  Widget build(_) => Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '$data',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(label),
        ]),
      );
}