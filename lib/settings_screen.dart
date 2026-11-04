
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/weather_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Temperature Unit',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                RadioListTile<String>(
                  title: const Text('Celsius (°C)'),
                  value: 'Celsius',
                  groupValue: provider.temperatureUnit,
                  onChanged: (value) {
                    if (value != null) {
                      provider.setTemperatureUnit(value);
                    }
                  },
                ),

                RadioListTile<String>(
                  title: const Text('Fahrenheit (°F)'),
                  value: 'Fahrenheit',
                  groupValue: provider.temperatureUnit,
                  onChanged: (value) {
                    if (value != null) {
                      provider.setTemperatureUnit(value);
                    }
                  },
                ),

                const SizedBox(height: 20),

                Text(
                  'Selected Unit: ${provider.temperatureUnit}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
