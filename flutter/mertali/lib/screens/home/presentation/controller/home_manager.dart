import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mertaliveonurcan/product/models/oneri.dart';
import 'package:mertaliveonurcan/product/models/user.dart';
import 'package:mertaliveonurcan/screens/home/data/home_repository.dart';

class HomeManager {
  final HomeRepository _homeRepository = HomeRepository(
    dio: Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api',
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    ),
  );

  Future<User> getProfile() async {
    return await _homeRepository.getProfile() ??
        User(id: null, email: '', firstName: '', lastName: '', avatar: '');
  }

  Future<List<Oneri>> getRandomSuggestions() async {
    String data = await rootBundle.loadString('assets/json/oneriler.json');
    List<dynamic> jsonList = json.decode(data)['data'];
    List<Oneri> oneriler = jsonList.map((e) => Oneri.fromJson(e)).toList();
    oneriler.shuffle();
    return oneriler;
  }
}
