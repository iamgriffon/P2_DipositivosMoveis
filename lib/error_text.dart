import 'package:flutter/material.dart';

class ScrollableText extends StatelessWidget {
  final String text;

  ScrollableText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(text),
      ),
    );
  }
}
