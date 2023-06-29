# Generate project 🚀
- Replace {{PROJECT_NAME}} by your project name (no spacing)
- Replace {{APP_NAME}} by your app name
- Replace {{PACKAGE_NAME}} your bundle identifier
Then remove this section

---


# Getting Started 🚀
- Extract flutter_gen.zip to .dart_tool folder

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --build-number=$BUILD_NUMBER --build-name=$APPVERSION

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart --build-number=$BUILD_NUMBER --build-name=$APPVERSION

# Production
$ flutter run --flavor production --target lib/main_production.dart --build-number=$BUILD_NUMBER --build-name=$APPVERSION
```

{{APP_NAME}}works on iOS & Android._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```
