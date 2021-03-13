import 'package:flutter/material.dart';
import 'package:kos_kosan_app/model/city.dart';
import 'package:kos_kosan_app/theme.dart';

class CityCard extends StatelessWidget {
  
  final City city;
  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
            children:[
              Image.asset(
                city.imageUrl,
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
             this.city.isPopular ? Align(
                alignment: Alignment.topRight,
                  child: Container(
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30)
                    )
                  ),
                  width: 50,
                  height: 30,
                  child: Center(
                    child: Image.asset('assets/images/Icon_star.png',width: 22,height: 22,)),
                ),
              ): Container()

          ]),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blackText.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
