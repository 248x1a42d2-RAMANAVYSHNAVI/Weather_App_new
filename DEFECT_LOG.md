# Weather App – Defect Log

## Project Information
- Project Name: Weather App
- Platform: Android
- Framework: Flutter
- Testing Environment: Android Emulator (Medium Phone)

## 1. Functional Testing Summary

The following application features were tested:

| Test Case | Result |
|---|---|
| Search weather by city | Passed |
| Display current weather | Passed |
| Display 7-day forecast | Passed |
| Add City form validation | Passed |
| Save and remove cities | Passed |
| Celsius/Fahrenheit settings | Passed |
| Weather Details screen | Passed |

No functional defects were observed during the tests performed.

## 2. Static Analysis Findings

The following code-quality findings were reported by `flutter analyze`:

| Finding | Location | Status |
|---|---|---|
| Use of print statements | weather_service.dart | Pending |
| Deprecated Radio button properties | settings_screen.dart | Pending |
| Relative imports in test file | widget_test.dart | Pending |
| Unused import in test file | widget_test.dart | Pending |

## 3. Testing Commands

```bash
flutter analyze
flutter test
flutter run
flutter build apk --release
```

## 4. Testing Result

- Flutter application built successfully.
- Application installed and ran on Android Emulator.
- Flutter widget tests passed.
- Release APK generated successfully.

## 5. Conclusion

The Weather App completed the functional tests listed above successfully. Static analysis findings are documented for further code-quality improvements.
