import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kos_kosan_app/model/space.dart';

class SpaceProvider extends ChangeNotifier {
  var url = 'https://bwa-cozy.herokuapp.com/recommended-spaces';
  getRecommedSpace() async {
    var result = await http.get(Uri.parse(url));


    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
  
      List<Space> spaces = data.map((items) => Space.fromJson(items)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
