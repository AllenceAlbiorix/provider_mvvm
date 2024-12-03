# Articles App with using Provider and Dependency Injection

# Clean Architecture in Flutter

# Unit Testing with Clean Architecture in Flutter | Mockito

A new Flutter project with Clean Architecture to fetch the New Work Time
Articles, display article details, and see more about more information from the url.

## Getting Started

## Architecture

- MVVM Clean Architecture

## Prerequisites

- Flutter SDK
    - Supported version (Channel stable, 3.24.3, Dart version 3.5.3)
- Android Studio or VS Code
- Dart plugin for your IDE

## Installing

- Clone the repository ```git clone https://github.com/YAMMEN98/ny-times-flutter-app.git```
- Open the project in Android Studio or VS Code.
- Run the app on an emulator or physical device.

## Feature

- Get all NY Times articles.
- Search articles.
- Filter article by ```period```
- Display article details.
- Apply Dark/Light theme.
- Apply localization en/ar languages.
- View the Image And Zoom It.
- Apply Unit Testing.

## Built With

- [Flutter](https://docs.flutter.dev/release/archive) - The framework used).
- [The New Work a Times API](https://developer.nytimes.com/) - API used for weather data.

## Unit Test

To run test you should follow the steps:

- run command ```flutter test```
- If you want to get coverage file from Unit Test run this.command ```flutter test --coverage```

There is many tools to generate text coverage,
we will use [test_cov_console](https://pub.dev/packages/test_cov_console) to generate coverage
report, follow these steps to run it:

- Run the following command to make sure all flutter library is up-to-date ```flutter pub get```,
    - Run the following command to generate lcov.info on coverage
      directory ```flutter test --coverage```,
    - Run the tool to generate report from lcov.info to the
      console ```flutter pub run test_cov_console```,
    - You can follow and see more of parameters
      in [test_cov_console](https://pub.dev/packages/test_cov_console).
    - You Can Output report to CSV file (-c, --csv, -o, --output)
      by ```flutter pub run test_cov_console -c --output=coverage/test_coverage.csv```
    - Open CSV file by excel and you will see like this result:

      ![Text Coverage](https://github.com/YAMMEN98/ny-times-flutter-app/blob/main/test_coverage.png)

