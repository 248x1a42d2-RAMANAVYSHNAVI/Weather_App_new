
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weather_provider.dart';
import 'settings_screen.dart';
import 'weather_details_screen.dart';
import 'add_city_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController cityController = TextEditingController();

  Future<void> searchCity() async {
    final enteredCity = cityController.text.trim();
    final provider = context.read<WeatherProvider>();

    if (enteredCity.isEmpty) {
      provider.setError('Please enter a city name');
      return;
    }

    await provider.searchCity(enteredCity);
  }

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
  void dispose() {
    cityController.dispose();
    super.dispose();
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
            title: const Text(
              'Weather App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            actions: [
              // Add City Icon
              IconButton(
                tooltip: 'Add City',
                icon: const Icon(Icons.add_location_alt),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCityScreen(),
                    ),
                  );
                },
              ),

              // Settings Icon
              IconButton(
                tooltip: 'Settings',
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
              ),

              // Weather Details Icon
              IconButton(
                tooltip: 'Weather Details',
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeatherDetailsScreen(),
                    ),
                  );
                },
              ),

              // Saved Cities Icon
              IconButton(
                tooltip: 'Saved Cities',
                icon: const Icon(Icons.bookmarks),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavedCitiesScreen(),
                    ),
                  );
                },
              ),

              // Save City Icon
              if (weather != null)
                IconButton(
                  tooltip: 'Save City',
                  icon: const Icon(Icons.bookmark_add),
                  onPressed: () async {
                    await provider.saveCity();

                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('City saved successfully!'),
                      ),
                    );
                  },
                ),
            ],
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 15),

                // City Search Field
                TextField(
                  controller: cityController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => searchCity(),
                  decoration: InputDecoration(
                    hintText: 'Enter city name',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Search Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: provider.isLoading ? null : searchCity,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Search Weather',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Loading Indicator
                if (provider.isLoading)
                  const CircularProgressIndicator(),

                // Error Message
                if (provider.errorMessage.isNotEmpty)
                  Text(
                    provider.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),

                // Weather Information
                if (weather != null && forecast != null) ...[
                  Text(
                    '${provider.cityName}, ${provider.country}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  Icon(
                    weatherIcon(
                      (weather['weather_code'] as num).toInt(),
                    ),
                    size: 90,
                    color: Colors.orange,
                  ),

                  Text(
                    '${(weather['temperature_2m'] as num).round()}${provider.temperatureSymbol}',
                    style: const TextStyle(
                      fontSize: 48,
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

                  // Current Weather Details
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          weatherInfo(
                            Icons.thermostat,
                            'Feels Like',
                            '${weather['apparent_temperature']}${provider.temperatureSymbol}',
                          ),
                          weatherInfo(
                            Icons.water_drop,
                            'Humidity',
                            '${weather['relative_humidity_2m']}%',
                          ),
                          weatherInfo(
                            Icons.air,
                            'Wind Speed',
                            '${weather['wind_speed_10m']} km/h',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 7-Day Forecast
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '7-Day Weather Forecast',
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
                          (forecast['weather_code'][index] as num).toInt();

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
                          subtitle: Text(weatherDescription(code)),
                          trailing: Text(
                            '${(forecast['temperature_2m_max'][index] as num).round()}${provider.temperatureSymbol} / '
                            '${(forecast['temperature_2m_min'][index] as num).round()}${provider.temperatureSymbol}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],

                // Initial Empty State
                if (weather == null &&
                    provider.errorMessage.isEmpty &&
                    !provider.isLoading)
                  const Column(
                    children: [
                      Icon(
                        Icons.cloud,
                        size: 100,
                        color: Colors.blue,
                      ),
                      Text(
                        'Search for a city',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Weather information will appear here',
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Weather Information Card
  Widget weatherInfo(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// Saved Cities Screen
class SavedCitiesScreen extends StatelessWidget {
  const SavedCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Saved Cities'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body: provider.savedCities.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 80,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No Saved Cities',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Search and save your favourite cities.'),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: provider.savedCities.length,
                  itemBuilder: (context, index) {
                    final city = provider.savedCities[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_city,
                          color: Colors.blue,
                        ),
                        title: Text(city),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            provider.removeCity(city);
                          },
                        ),
                        onTap: () async {
                          Navigator.pop(context);
                          await provider.searchCity(city);
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
