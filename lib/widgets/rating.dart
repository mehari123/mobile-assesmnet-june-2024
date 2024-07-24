import 'package:flutter/material.dart';

import '../models/product/rating.dart';

// Update this import path to where your Rating model is located.

class RatingDisplay extends StatelessWidget {
  final Rating rating;

  const RatingDisplay({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(2, (index) {
          return Icon(
            index < rating.rate!.floor() ? Icons.star : Icons.star_border,
            color: Colors.amber,
          );
        }),
        if (rating.rate! % 1 >= 0.5)
          Icon(Icons.star_half, color: Colors.amber), // For half star, if needed
        SizedBox(width: 8),
        Text('${rating.count} reviews'),
      ],
    );
  }
}