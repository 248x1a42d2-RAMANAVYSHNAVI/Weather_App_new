
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/weather_provider.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({super.key});

  @override
  State<AddCityScreen> createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cityController = TextEditingController();

  bool isSubmitting = false;

  Future<void> addCity() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    final provider = context.read<WeatherProvider>();
    final city = cityController.text.trim();

    await provider.searchCity(city);

    if (!mounted) return;

    if (provider.weather != null) {
      await provider.saveCity();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${provider.cityName} saved successfully!'),
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            provider.errorMessage.isEmpty
                ? 'Unable to add city. Please try again.'
                : provider.errorMessage,
          ),
        ),
      );

      setState(() {
        isSubmitting = false;
      });
    }
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('Add City'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),

              const Icon(
                Icons.add_location_alt,
                size: 90,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Add a New City',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Enter a city name to check its weather and save it.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 35),

              TextFormField(
                controller: cityController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'City Name',
                  hintText: 'Example: Guntur',
                  prefixIcon: const Icon(Icons.location_city),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a city name';
                  }

                  if (!RegExp(r"^[a-zA-Z\s.'-]+$")
                      .hasMatch(value.trim())) {
                    return 'Please enter a valid city name';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: isSubmitting ? null : addCity,
                  icon: isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.add),
                  label: Text(
                    isSubmitting ? 'Adding City...' : 'Add City',
                    style: const TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
