import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final rating;

  const Rating(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(
          Icons.star,
          color: getColorByValue(1, rating),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: getColorByValue(2, rating),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: getColorByValue(3, rating),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: getColorByValue(4, rating),
          size: 16,
        ),
        Icon(
          Icons.star,
          color: getColorByValue(5, rating),
          size: 16,
        ),
      ],
    );
  }
}

Color getColorByValue(int starValue, int ratingValue) {
  if (starValue <= ratingValue) {
    return Colors.orange;
  } else {
    return Colors.black12;
  }
}
