# Base Project

![coverage][coverage_badge]

App for helping Army veterans find jobs in the civil market.

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

For production builds use the script at `tool/build/build.sh`. The script will generate 
obfuscation symbol mappings. Those symbols won't be included into source control, but please 
don't delete them, unless you are sure they are stored elsewhere. Otherwise we won't be able to 
read alarms at any app monitoring tool.

_\*CivStart works on iOS and Android._

This project contains auto-generated code, and the code generator needs to be invoked everytime there's a change
in the code annotated to be generated.

To run the code generator, execute the following command:

```sh
# For a one-off build
dart run build_runner build -d
```

```sh
# For constantly building automatically as the code changes
dart run build_runner watch -d
```

## Adding assets

The project uses `assets_gen` for generating a class with all the assets' paths. If you add a new asset into the 
asset directory, then run this command to update the generated assets' class:

 - For one-off builds:

```sh
dart run assets_gen build
```

- For continuously building as you add more assets:

```sh
dart pub run assets_gen watch
```

The `build_runner` executions should also create those assets, but calling it is more expensive, as it will 
 build all other generated code in the project.

---

## Data Models

Data is modelled for use with Bloc & Cubits using the Freezed pub package. In order to generate the 
freezed classes, see the code generation section above.

TODO(mfeinstein): expand this to include architecture.

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Soft Skills Quiz

The quiz result data is saved in local secure storage. Thus if the number of questions, or their order, 
or de skills, change in the future, then the app will need custom migration logic to adapt the
scores saved, to the new set of questions.

---

### Firebase

We are using Firebase for App Distribution, so a simplified version of the Firebase project setup was made,
i.e. we didn't create one Firebase project for each environment (production, staging and development). If
we need to use Firebase Auth, Firebase Cloud Firestore, or any other service that needs separation of 
environments, then we will have to create separate Firebase projects.

The Firebase setup was made using the `flutterfire` cli version 0.3.0-dev.16. This experimental version 
is the only who supports configurating different app flavours. Unfortunately it's not yet production ready 
and has bugs.

You can use it running the following command, substituting the correct parameters. Please take a look
at the current native side folder structures to avoid misconfiguring Firebase.

```console
flutterfire configure \
--project="civstart" \
--platforms="ios,android" \
--ios-build-config=Debug-production \
--ios-out=/ios/Runner/GoogleService-Info.plist \
--android-out=/android/app/google-services.json \
--ios-bundle-id="com.theprojectfactory.civstart" \
--android-package-name="com.theprojectfactory.civstart" \
--out=/firebase/firebase_options_production.dart
--debug-symbols-ios \
--overwrite-firebase-options \
--yes
```

Or for the other environments:

```console
flutterfire configure \
--project="civstart" \
--platforms="ios,android" \
--ios-build-config=Debug-staging \
--ios-out=/ios/Runner/staging/GoogleService-Info.plist \
--android-out=/android/app/src/staging/google-services.json \
--ios-bundle-id="com.theprojectfactory.civstart.stg" \
--android-package-name="com.theprojectfactory.civstart.stg" \
--out=/firebase/firebase_options_staging.dart
```

Don't include option `--debug-symbols-ios` while we don't add Crashlytics into the project.

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
