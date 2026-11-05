import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<void> testConnection() async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=Guntur&appid=4471acadcc863a4d468b670b19524c73&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint(data.toString());
    } else {
      debugPrint('Error: ${response.statusCode}');
    }
  }
}