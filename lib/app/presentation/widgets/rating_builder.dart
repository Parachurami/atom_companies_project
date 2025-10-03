import 'package:flutter/material.dart';

class RatingBuilder extends StatelessWidget {
  const RatingBuilder({super.key, required this.rating});
  final dynamic rating;

  @override
  Widget build(BuildContext context) {

      return Row(
        children: [
          for(var i = 0; i< rating; i++)
            Icon(Icons.star_rounded, color: Colors.amber,)
        ],
      );

  }
}