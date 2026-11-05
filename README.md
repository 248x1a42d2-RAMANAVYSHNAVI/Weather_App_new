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
- Add and remove saved cities.
- View detailed weather information.
- Change temperature units between Celsius and Fahrenheit.
- Store saved cities and temperature preferences using SharedPreferences.
- Form validation when adding a city.

## 3. Technologies Used

- Flutter
- Dart
- Provider (State Management)
- Open-Meteo Weather API
- HTTP Package
- SharedPreferences
- Visual Studio Code

## 4. Data Source

Weather information is retrieved from the Open-Meteo public API.

- Geocoding API: https://geocoding-api.open-meteo.com/
- Weather API: https://api.open-meteo.com/

The Geocoding API converts city names into geographical coordinates. The Weather API provides current weather conditions and forecast information.

## 5. Application Screens

### Home Screen

Displays current weather information, city search, temperature, and weather conditions.

### Add City Screen

Allows users to add new cities with input validation.

### Weather Details Screen

Displays detailed weather information, including feels-like temperature, humidity, and wind speed.

### Saved Cities Screen

Allows users to view, save, select, and remove their favourite cities.

### Settings Screen

Allows users to change temperature units between Celsius and Fahrenheit.

## 6. Screenshots

### Home Screen

![Home Screen](screenshorts/home_screen.png)

### Add City Screen

![Add City Screen](screenshorts/add_city.png)

### Weather Details Screen

![Weather Details](screenshorts/weather_details.png)

## 7. Team Members

| S.No. | Name | College ID | GitHub Username |
|---|---|---|---|
| 1 | RAMANA VYSHNAVI | 248X1A42D2 | vyshu2301 |
| 2 | UPPALA SRI LAKSHMI PRASANNA | 248X1A42G3 | 248x1a42g3-prasanna |
| 3 | V. SANTHOSH | 248X1A42G4 | santhoshValaparla |

## 8. Team Contributions

### RAMANA VYSHNAVI

- Main Flutter application development.
- Weather API integration.
- Application feature implementation.
- Code fixes and project integration.
- GitHub repository management.

### UPPALA SRI LAKSHMI PRASANNA

- Application screens and features documentation.
- Reviewing and verifying screen descriptions.
- Documentation updates in the GitHub repository.

### V. SANTHOSH

- Testing and Quality Assurance documentation.
- Reviewing functional testing results.
- Verifying QA documentation in `DEFECT_LOG.md`.
- Reviewing testing and installation documentation.

**Note:** Main application coding was completed by RAMANA VYSHNAVI. Documentation and testing review responsibilities were handled by the respective team members.

## 9. Installation and Run Instructions

1. Install Flutter SDK.
2. Install Visual Studio Code.
3. Install Flutter and Dart extensions.
4. Clone or download the project repository.
5. Open the project folder in VS Code.
6. Open the terminal and run:

```bash
flutter pub get
```

7. Connect an Android device or start an emulator.
8. Run the application:

```bash
flutter run
```

## 10. Testing

Run the following commands:

```bash
flutter analyze
flutter test
flutter run
```

### Testing Results

- Flutter analysis completed with no issues.
- Flutter widget test passed.
- Application launched successfully on Android Emulator.
- Release APK generated successfully.
- Release APK installed successfully on Android Emulator.

## 11. Release APK

Release APK location:

`build/app/outputs/flutter-apk/app-release.apk`

Build command:

```bash
flutter build apk --release
```

The release APK was successfully generated and installed on the Android Emulator.

## 12. Defect Log

Refer to [DEFECT_LOG.md](DEFECT_LOG.md) for functional testing results, code quality findings, fixes, and pending verification items.

## 13. Known Limitations and Pending Verification

- Physical Android device installation and testing.
- Offline-condition testing.
- Long and empty input testing.
- Repeated user-action testing.
- Screen rotation testing.

## 14. Future Enhancements

- Improve the user interface.
- Add more weather information.
- Improve error handling and testing.
- Add additional automated tests.

## 15. Institution

Kallam Harinadh Reddy Institute of Technology (KHIT), Guntur.

## 16. GitHub Repository

Project Repository:

https://github.com/248x1a42d2-RAMANAVYSHNAVI/Weather_App_new

## 17. Conclusion

The Weather App demonstrates the development of a Flutter-based Android application using API integration, Provider state management, and local storage. The application has passed Flutter static analysis and widget testing and has been successfully built for Android.

Physical device testing and additional robustness verification remain pending.