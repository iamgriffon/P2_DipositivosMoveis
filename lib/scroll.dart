import 'package:flutter/material.dart';

class ScrollableImages extends StatelessWidget {
  final List<String> imageUrls;

  ScrollableImages({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageUrls
            .map((url) => Container(
                  width: 250,
                  height: 250,
                  margin: EdgeInsets.all(10.0), // Add some margin
                  child: Image.network(url, fit: BoxFit.cover),
                ))
            .toList(),
      ),
    );
  }
}
