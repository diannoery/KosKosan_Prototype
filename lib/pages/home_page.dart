import 'package:flutter/material.dart';
import 'package:kos_kosan_app/model/city.dart';
import 'package:kos_kosan_app/model/guideTips.dart';
import 'package:kos_kosan_app/model/space.dart';
import 'package:kos_kosan_app/provider/space_provider.dart';
import 'package:kos_kosan_app/theme.dart';
import 'package:kos_kosan_app/widgets/bottom_navbar.dart';
import 'package:kos_kosan_app/widgets/city_card.dart';
import 'package:kos_kosan_app/widgets/guide.dart';
import 'package:kos_kosan_app/widgets/space_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeSpace = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          // NOTE: Title/HEader
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Explore Now",
                style: blackText.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : Popular City
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Popular Cities",
                style: regularText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png')),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 1,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true)),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(City(
                      id: 1,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.png')),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE : Recomended Space
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Recommended Space",
                style: blackText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: FutureBuilder(
                  future: homeSpace.getRecommedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;
                      int index = 0;
                      return Column(
                        children: data.map((items) {
                          index++;
                        return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30
                            ),
                            child: SpaceCard(items),
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
            // NOTE GUIDE
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Tips & Guidance",
                style: blackText.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 14,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Guide(GuideTips(
                      id: 1,
                      name: 'City Guidelines',
                      imageUrl: 'assets/images/icon.png',
                      date: 'Updated 20 Apr')),
                  SizedBox(
                    height: 20,
                  ),
                  Guide(GuideTips(
                      id: 1,
                      name: 'Jakarta Fairship',
                      imageUrl: 'assets/images/icon2.png',
                      date: 'Updated 11 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + 24.0,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 55,
        width: MediaQuery.of(context).size.width - (2 * 24),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavbarBottom(
                imageUrl: 'assets/images/icon_home.png', isActive: true),
            NavbarBottom(
                imageUrl: 'assets/images/icon_mail.png', isActive: false),
            NavbarBottom(
                imageUrl: 'assets/images/icon_card.png', isActive: false),
            NavbarBottom(
                imageUrl: 'assets/images/icon_love.png', isActive: false),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
