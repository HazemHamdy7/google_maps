import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constant/strings.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }

  Future<List<dynamic>> fetchSuggestions(
    String place,
    String sessionToken,
  ) async {
    try {
      Response response = await dio.get(suggestionUrl, queryParameters: {
        'input': place,
        'types': 'address',
        'components': 'country:eg',
        'key': apiKey,
        'sessiontoken': sessionToken,
      });
      debugPrint(response.data['predictions']);
      print(response.statusCode);
      return response.data['predictions'];
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }
}
