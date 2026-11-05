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

## 3. Identified Code Quality Findings

The following findings were reported during `flutter analyze`.

| S.No. | Finding | Location | Steps to Reproduce | Status |
|---|---|---|---|---|
| 1 | Use of print statements | lib/services/weather_service.dart | Run `flutter analyze` | Pending |
| 2 | Deprecated Radio button properties | lib/settings_screen.dart | Run `flutter analyze` | Pending |
| 3 | Relative imports in test file | test/widget_test.dart | Run `flutter analyze` | Pending |
| 4 | Unused import in test file | test/widget_test.dart | Run `flutter analyze` | Pending |

## 4. Testing Commands

The following commands were used during project testing:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
flutter build apk --release
```

## 5. Testing Results

- Dependencies were installed successfully.
- Flutter widget test completed successfully.
- Application ran successfully on the Android Emulator.
- Release APK was generated successfully.
- Functional tests listed above passed.
- Code quality findings are documented for further improvement.

## 6. Known Limitations and Pending Verification

- Static analysis findings require further improvement.
- Physical Android device installation and testing are pending.
- Additional robustness testing, including offline conditions and repeated user actions, requires verification.

## 7. Conclusion

The Weather App successfully completed the functional tests listed in this document. The application was built and tested on an Android Emulator, and a release APK was generated successfully.

The code quality findings and pending verification items are documented for future improvement.

**Note:** Only verified test results are marked as Passed. Pending items should be updated after they are fixed or tested.