# Read More Plus

The Read More Plus Plugin is a versatile and user-friendly tool designed to enhance the readability and user experience. This plugin provides a powerful "Read More" widget that allows you to create expandable sections within your application, making it easier for users to access additional content without overwhelming them.

## Features

- **Custom Text Styling**: Easily customize the text style of the "Read More" widget to match your application's look and feel.

- **Maximum Line Control**: You can define the maximum number of lines to display before the "Read More" link appears, providing you with control over the content's visibility.

- **Responsive Design**: The widget automatically adjusts to different screen sizes, ensuring a seamless experience for all users.

- **Intuitive User Experience**: Improve user engagement by giving them the ability to expand or collapse sections of your application at their convenience.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  read_more_plus: ^0.0.1
```

Run `flutter pub` get to install the package.


## Usage

Import the package in your Dart code:

```dart
import 'package:read_more_plus/read_more_plus.dart';
```

Use the ReadMore widget in your widget tree:

```dart
ReadMore(
    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
)
```

## Customization

You can customize the ReadMore widget by providing different parameters to the `ReadMore` constructor:

```dart
ReadMore(
  text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  maxLines: 3,
  readMoreTextColor: Colors.redAccent,
  expandedText: 'show less',
  collapsedText: 'show more',
  style: Theme.of(context).textTheme.labelLarge!.copyWith(
      color: Colors.deepPurple,
      fontSize: size.height*0.014
  ),
)
```
