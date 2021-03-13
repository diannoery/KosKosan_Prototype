import 'package:flutter/material.dart';
import 'package:kos_kosan_app/theme.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/Icon_star.png',
        width: 20,
        color: index <= rating ? orangeColor : greyColor,
      ),
    );
  }
}
