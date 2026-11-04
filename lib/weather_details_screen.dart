
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  String weatherDescription(int code) {
    if (code == 0) return 'Clear Sky';
    if (code <= 3) return 'Partly Cloudy';
    if (code <= 48) return 'Foggy';
    if (code <= 57) return 'Drizzle';
    if (code <= 67) return 'Rainy';
    if (code <= 77) return 'Snowy';
    if (code <= 82) return 'Rain Showers';
    if (code <= 86) return 'Snow Showers';
    if (code <= 99) return 'Thunderstorm';
    return 'Unknown';
  }

  IconData weatherIcon(int code) {
    if (code == 0) return Icons.wb_sunny;
    if (code <= 3) return Icons.cloud;
    if (code <= 48) return Icons.foggy;
    if (code <= 67) return Icons.water_drop;
    if (code <= 77) return Icons.ac_unit;
    if (code <= 82) return Icons.grain;
    return Icons.thunderstorm;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        final weather = provider.weather;
        final forecast = provider.forecast;

        return Scaffold(
          backgroundColor: Colors.blue.shade50,
          appBar: AppBar(
            title: const Text('Weather Details'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.errorMessage.isNotEmpty
                  ? Center(
                      child: Text(
                        provider.errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : weather == null || forecast == null
                      ? const Center(
                          child: Text(
                            'Please search for a city first.',
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${provider.cityName}, ${provider.country}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 15),

                              Icon(
                                weatherIcon(
                                  (weather['weather_code'] as num).toInt(),
                                ),
                                size: 85,
                                color: Colors.orange,
                              ),

                              Text(
                                '${(weather['temperature_2m'] as num).round()}${provider.temperatureSymbol}',
                                style: const TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                weatherDescription(
                                  (weather['weather_code'] as num).toInt(),
                                ),
                                style: const TextStyle(fontSize: 20),
                              ),

                              const SizedBox(height: 25),

                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Current Weather Details',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              detailCard(
                                Icons.thermostat,
                                'Feels Like',
                                '${weather['apparent_temperature']}${provider.temperatureSymbol}',
                              ),

                              detailCard(
                                Icons.water_drop,
                                'Humidity',
                                '${weather['relative_humidity_2m']}%',
                              ),

                              detailCard(
                                Icons.air,
                                'Wind Speed',
                                '${weather['wind_speed_10m']} km/h',
                              ),

                              const SizedBox(height: 25),

                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '7-Day Forecast Details',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              ...List.generate(
                                (forecast['time'] as List).length,
                                (index) {
                                  final code =
                                      (forecast['weather_code'][index]
                                          as num)
                                          .toInt();

                                  final maxTemp =
                                      (forecast['temperature_2m_max'][index]
                                              as num)
                                          .round();

                                  final minTemp =
                                      (forecast['temperature_2m_min'][index]
                                              as num)
                                          .round();

                                  return Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: Icon(
                                        weatherIcon(code),
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                      title: Text(
                                        forecast['time'][index].toString(),
                                      ),
                                      subtitle: Text(
                                        weatherDescription(code),
                                      ),
                                      trailing: Text(
                                        '$maxTemp${provider.temperatureSymbol} / $minTemp${provider.temperatureSymbol}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
        );
      },
    );
  }

  Widget detailCard(IconData icon, String title, String value) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(title),
        trailing: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
