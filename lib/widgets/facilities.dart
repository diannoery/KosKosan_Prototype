import 'package:flutter/material.dart';
import 'package:kos_kosan_app/theme.dart';

class Facilities extends StatelessWidget {
  final String imageUrl;
  final int number;
  final String desc;

  Facilities({this.imageUrl, this.number,this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Image.asset(imageUrl,width: 32,),
       SizedBox(
         height: 8,
       ),
       Text.rich(TextSpan(
                  text: '${number} ',
                  style: purpleText.copyWith(fontSize: 14),
                  children: [
                    TextSpan(
                        text: ' ${desc}', style: greyText.copyWith(fontSize: 14))
                  ])),
     ],
    );
  }
}