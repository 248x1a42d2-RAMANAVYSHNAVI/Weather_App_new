# Weather App – Defect Log

## 1. Project Information

- **Project Name:** Weather App
- **Platform:** Android
- **Framework:** Flutter
- **Programming Language:** Dart
- **Testing Environment:** Android Emulator (Medium Phone)

## 2. Functional Testing Summary

| S.No. | Test Case | Expected Result | Actual Result | Status |
|---|---|---|---|---|
| 1 | Search weather by city | Weather information should be displayed | Worked as expected | Passed |
| 2 | Display current weather | Current weather details should appear | Worked as expected | Passed |
| 3 | Display 7-day forecast | Forecast should be displayed | Worked as expected | Passed |
| 4 | Add City form validation | Invalid input should show validation messages | Worked as expected | Passed |
| 5 | Save and remove cities | Cities should be saved and removed | Worked as expected | Passed |
| 6 | Celsius/Fahrenheit settings | Temperature unit should change | Worked as expected | Passed |
| 7 | Weather Details screen | Detailed weather information should appear | Worked as expected | Passed |

## 3. Code Quality Findings and Fixes

The following issues were identified using `flutter analyze` and fixed.

| S.No. | Finding | Location | Resolution | Status |
|---|---|---|---|---|
| 1 | Use of print statements | lib/services/weather_service.dart | Replaced print with debugPrint | Fixed |
| 2 | Deprecated Radio button properties | lib/settings_screen.dart | Updated to use RadioGroup | Fixed |
| 3 | Relative imports in test file | test/widget_test.dart | Removed unnecessary relative imports | Fixed |
| 4 | Unused import | test/widget_test.dart | Removed unused import | Fixed |

## 4. Testing Commands

```bash
flutter pub get
flutter analyze
flutter test
flutter run
flutter build apk --release