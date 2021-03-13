import 'package:flutter/material.dart';
import 'package:kos_kosan_app/model/guideTips.dart';
import 'package:kos_kosan_app/theme.dart';

class Guide extends StatelessWidget {
  final GuideTips guide;
  Guide(this.guide);

  @override
  Widget build(BuildContext context) {
    return Row(
      children : [
        Image.asset(guide.imageUrl,width: 80,),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(guide.name , style: blackText.copyWith(
              fontSize: 18
            ),),
            
             SizedBox(
              width: 16,
            ),
            Text(guide.date , style: greyText.copyWith(
              fontSize: 14
            ),),
          ],
        ),
        Spacer(),
        IconButton(icon: Icon(Icons.chevron_right,color: greyColor,), onPressed: (){})

      ],
    );
  }
}