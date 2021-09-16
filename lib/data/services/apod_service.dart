import 'dart:convert';

import 'package:apod_app/constants.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ApodRequestFailure implements Exception {}

class ApodNotFoundFailure implements Exception {}

class ApodService {
  static const FETCH_LIMIT = 15;

  Future<dynamic> fetchToday() async {
    var url = Uri.parse(BASE_URL + "?api_key=$API_KEY");

    print(url);
    try {
      final response = await get(url);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (err) {
      print(err.toString());
      return [];
    }
  }

  Future<List<dynamic>> fetchThisWeek() async {
    final DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    final DateTime lastWeek = DateTime.now().subtract(Duration(days: 7));

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedYesterday = formatter.format(yesterday);
    final String formattedLastWeek = formatter.format(lastWeek);

    // final response = await get(url);

    // if (response.statusCode != 200) {
    //   throw ApodRequestFailure();
    // }

    // final bodyJson = jsonDecode(response.body) as List<dynamic>;

    // if (bodyJson.isEmpty) {
    //   throw ApodNotFoundFailure();
    // }

    // print(bodyJson);
    // return bodyJson;
    try {
      var url = Uri.parse(BASE_URL +
          "?start_date=$formattedLastWeek&end_date=$formattedYesterday&api_key=$API_KEY");

      print(url);
      // final response = await get(Uri.parse(BASE_URL +
      //     "?start_date=$formattedYesterday&end_date=$formattedLastWeek&api_key=$API_KEY"));
      final response = await get(url);
      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      return [];
    }
  }

  Future<List<dynamic>> fetchOlderApods() async {
    final DateTime yesterday = DateTime.now().subtract(Duration(days: 8));
    final DateTime lastWeek = yesterday.subtract(Duration(days: 30));

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedYesterday = formatter.format(yesterday);
    final String formattedLastWeek = formatter.format(lastWeek);

    try {
      var url = Uri.parse(BASE_URL +
          "?start_date=$formattedLastWeek&end_date=$formattedYesterday&api_key=$API_KEY");

      print(url);
      final response = await get(url);
      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      return [];
    }
  }
}
