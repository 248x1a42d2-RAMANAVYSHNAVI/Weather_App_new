# Weather App

## 1. Project Description
Weather App is a Flutter-based Android application that allows users to search for weather information in different cities. It provides current weather conditions, temperature details, and a 7-day weather forecast using the Open-Meteo API.

## 2. Features
- Search weather by city name.
- View current temperature and weather conditions.
- Check feels-like temperature.
- View humidity and wind speed.
- View a 7-day weather forecast.
- Add and save favourite cities.
- View detailed weather information.
- Change temperature units (Celsius and Fahrenheit).
- Store saved cities using SharedPreferences.

## 3. Technologies Used
- Flutter
- Dart
- Provider (State Management)
- Open-Meteo API
- SharedPreferences

## 4. Application Screens
### Home Screen
Displays the current weather information for the selected city, including temperature, weather conditions, humidity, wind speed, and forecast.

### Add City Screen
Allows users to enter a city name and add it to the saved cities list.

### Weather Details Screen
Displays additional weather information for the selected city.

### Saved Cities Screen
Allows users to view and select their saved favourite cities.

### Settings Screen
Allows users to change the temperature unit between Celsius and Fahrenheit.

## 5. Screenshots
### Home Screen
![Home Screen](screenshorts/home_screen.png)

### Add City Screen
![Add City Screen](screenshorts/add_city.png)

### Weather Details Screen
![Weather Details](screenshorts/weather_details.png)

## 6. API Used
Open-Meteo Weather API: https://open-meteo.com/

## 7. How to Run the Project
1. Clone this repository.
2. Open the project in VS Code.
3. Run `flutter pub get`.
4. Connect an Android device or start an emulator.
5. Run `flutter run`.

## 8. Testing
- Flutter code analysis completed with no issues.
- Widget test executed successfully.
- Release APK generated successfully.
- Physical Android device testing is pending.

## 9. Team Members
1. RAMANA VYSHNAVI – 248X1A42D2
2. UPPALA SRI LAKSHMI PRASANNA – 248X1A42G3
3. V. SANTHOSH – 248X1A42G4

## 10. Team Contributions
- **RAMANA VYSHNAVI:** Main Flutter application development, API integration, application features, code fixes, and project integration.
- **UPPALA SRI LAKSHMI PRASANNA:** Application screens and features documentation, after reviewing and verifying the screen descriptions.
- **V. SANTHOSH:** Testing and QA documentation, after reviewing and verifying the test results.

*Note: Main application coding was completed by RAMANA VYSHNAVI. Documentation and testing responsibilities should be reviewed and completed by the respective team members.*

## 11. Defect Log
Refer to [DEFECT_LOG.md](DEFECT_LOG.md) for testing details and defect status.

## 12. Project Repository
https://github.com/248x1a42d2-RAMANAVYSHNAVI/Weather_App_new

## 13. Institution
Kallam Haranadhareddy Institute of Technology (KHIT), Guntur

## 14. Conclusion
The Weather App provides a simple way to search for weather information, view forecasts, and save favourite cities using Flutter and the Open-Meteo API.