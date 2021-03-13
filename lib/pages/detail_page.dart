import 'package:flutter/material.dart';
import 'package:kos_kosan_app/model/space.dart';
import 'package:kos_kosan_app/pages/not_found.dart';
import 'package:kos_kosan_app/theme.dart';
import 'package:kos_kosan_app/widgets/facilities.dart';
import 'package:kos_kosan_app/widgets/ratingItem.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space spaces;
  DetailPage(this.spaces);

  @override
  Widget build(BuildContext context) {
    launchURL(String _url) async => await canLaunch(_url)
        ? await launch(_url)
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotFound()));

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                spaces.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: whiteColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          // Note : Title
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      spaces.name,
                                      style: blackText.copyWith(fontSize: 22),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text.rich(TextSpan(
                                        text: '\$${spaces.price} ',
                                        style:
                                            purpleText.copyWith(fontSize: 16),
                                        children: [
                                          TextSpan(
                                              text: '/ month',
                                              style: greyText.copyWith(
                                                  fontSize: 16))
                                        ])),
                                  ],
                                ),

                                SizedBox(
                                  width: 40,
                                ),
                                //Note: Rating
                                Row(
                                  children: [1, 2, 3, 4, 5].map((item) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        left: 2
                                      ),
                                      child: RatingItem(
                                      index: item,
                                      rating: spaces.rating,
                                    ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Note: Facilities
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              "Main Facilities",
                              style: blackText.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Facilities(
                                  imageUrl: 'assets/images/bar.png',
                                  number: spaces.numberKitchen,
                                  desc: 'Kitchen',
                                ),
                                Facilities(
                                  imageUrl: 'assets/images/bed.png',
                                  number: spaces.numberBed,
                                  desc: 'Bedroom',
                                ),
                                Facilities(
                                  imageUrl: 'assets/images/board.png',
                                  number: spaces.numberCupBoard,
                                  desc: 'Big Lemari',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //Note Photo
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              "Photos",
                              style: blackText.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                              height: 88,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: spaces.photos.map((item) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 24),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        item,
                                        height: 88,
                                        width: 110,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )),
                          SizedBox(
                            height: 30,
                          ),

                          //Location
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              "Location",
                              style: blackText.copyWith(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${spaces.address}\n${spaces.city}",
                                  style: greyText,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchURL(spaces.mapUrl);
                                  },
                                  child: Image.asset(
                                    'assets/images/btn_map.png',
                                    width: 40,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            height: 50,
                            width: MediaQuery.of(context).size.width - (2 * 24),
                            child: RaisedButton(
                              onPressed: () {
                                launchURL("tel:${spaces.phone}");
                              },
                              color: purpleColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              child: Text(
                                "Book Now",
                                style: whiteText.copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/images/btn_back.png',
                          width: 40,
                        )),
                    Image.asset(
                      'assets/images/btn_wishlist.png',
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
