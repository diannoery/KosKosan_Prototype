import 'package:flutter/cupertino.dart';

class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String mapUrl;
  String phone;
  List photos;
  int numberBed;
  int numberKitchen;
  int numberCupBoard;
  Space({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.city,
    this.country,
    this.rating,
    this.address,
    this.mapUrl,
    this.phone,
    this.photos,
    this.numberBed,
    this.numberKitchen,
    this.numberCupBoard,
  });
  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    photos = json['photos'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    numberBed = json['number_of_bedrooms'];
    numberCupBoard = json['number_of_cupboards'];
    numberKitchen = json['number_of_kitchens'];
  }
}
