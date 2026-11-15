# Five by Five

A Flutter app for practising multiplication and division, with a Russian-language interface.

## Features

- Select multiplication tables to practise.
- Learn multiplication facts and check your knowledge.
- Track correct answers, errors, response times and scores.
- View and share a lesson report using the system share sheet.
- Receive sound feedback for incorrect answers.

## Requirements

- Flutter with Dart 3.9.2 or later compatible with the package constraints.
- For iOS: macOS, Xcode with an iOS Simulator runtime, and CocoaPods.

This restored repository includes iOS and macOS platform projects.

## Run

```sh
git clone https://github.com/IvanKirilin/five-by-five.git
cd five-by-five
flutter pub get
flutter devices
flutter run -d <device-id>
```

## Validate and build

```sh
flutter analyze
flutter build ios --simulator --debug
```

Open an iOS Simulator before running the app. The committed lockfiles preserve the resolved dependencies. Generated files, Pods, build output and local IDE settings are excluded from Git.
