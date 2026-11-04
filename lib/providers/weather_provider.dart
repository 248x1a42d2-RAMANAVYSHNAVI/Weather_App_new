
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;

  String cityName = '';
  String country = '';
  String errorMessage = '';

  String temperatureUnit = 'Celsius';

  String get temperatureSymbol =>
      temperatureUnit == 'Celsius' ? '°C' : '°F';

  Map<String, dynamic>? weather;
  Map<String, dynamic>? forecast;

  List<String> savedCities = [];

  WeatherProvider() {
    loadSavedCities();
    loadTemperatureUnit();
  }

  Future<void> loadSavedCities() async {
    final prefs = await SharedPreferences.getInstance();
    savedCities = prefs.getStringList('savedCities') ?? [];
    notifyListeners();
  }

  Future<void> loadTemperatureUnit() async {
    final prefs = await SharedPreferences.getInstance();
    temperatureUnit = prefs.getString('temperatureUnit') ?? 'Celsius';
    notifyListeners();
  }

  Future<void> setTemperatureUnit(String unit) async {
    if (temperatureUnit == unit) return;

    temperatureUnit = unit;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('temperatureUnit', unit);

    if (cityName.isNotEmpty) {
      await searchCity(cityName);
    } else {
      notifyListeners();
    }
  }

  Future<void> saveCity() async {
    if (cityName.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();

    if (!savedCities.any(
      (city) => city.toLowerCase() == cityName.toLowerCase(),
    )) {
      savedCities.add(cityName);
      await prefs.setStringList('savedCities', savedCities);
      notifyListeners();
    }
  }

  Future<void> removeCity(String city) async {
    savedCities.removeWhere(
      (item) => item.toLowerCase() == city.toLowerCase(),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('savedCities', savedCities);
    notifyListeners();
  }

  Future<void> searchCity(String enteredCity) async {
    isLoading = true;
    errorMessage = '';
    weather = null;
    forecast = null;
    notifyListeners();

    try {
      final geoUrl = Uri.https(
        'geocoding-api.open-meteo.com',
        '/v1/search',
        {
          'name': enteredCity,
          'count': '1',
          'language': 'en',
          'format': 'json',
        },
      );

      final geoResponse = await http.get(geoUrl);

      if (geoResponse.statusCode != 200) {
        throw Exception('Unable to find city');
      }

      final geoData = jsonDecode(geoResponse.body);
      final results = geoData['results'];

      if (results == null || results.isEmpty) {
        throw Exception('City not found. Check spelling.');
      }

      final location = results[0];

      final weatherUrl = Uri.https(
        'api.open-meteo.com',
        '/v1/forecast',
        {
          'latitude': location['latitude'].toString(),
          'longitude': location['longitude'].toString(),
          'current':
              'temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m',
          'daily':
              'weather_code,temperature_2m_max,temperature_2m_min',
          'temperature_unit':
              temperatureUnit == 'Celsius' ? 'celsius' : 'fahrenheit',
          'timezone': 'auto',
          'forecast_days': '7',
        },
      );

      final weatherResponse = await http.get(weatherUrl);

      if (weatherResponse.statusCode != 200) {
        throw Exception('Unable to get weather data');
      }

      final weatherData = jsonDecode(weatherResponse.body);

      cityName = location['name'] ?? enteredCity;
      country = location['country'] ?? '';
      weather = weatherData['current'];
      forecast = weatherData['daily'];
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setError(String message) {
    errorMessage = message;
    weather = null;
    forecast = null;
    notifyListeners();
  }
}
