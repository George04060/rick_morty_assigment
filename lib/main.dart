// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_vendora/ui/screen/character_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set portrait orientation.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DisplayCharacterScreen(),
      },
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Define the default brightness and colors.
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color.fromARGB(204, 38, 47, 49),
        secondary: Color.fromARGB(255, 235, 161, 2),
        background: Color.fromARGB(255, 0, 0, 0),
      ),

      // Define the default font family.
      fontFamily: "Georgia",

      // Define the default `TextTheme`
      textTheme: const TextTheme(
        // Use for the name of the character in detail-view.
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),

        // Use for the name of the app in app-bar.
        headline6: TextStyle(
          fontSize: 40,
          shadows: [
            Shadow(
              color: Color.fromARGB(228, 255, 238, 46),
              blurRadius: 7.0,
              offset: Offset(3.0, 3.0),
            ),
            Shadow(
              color: Color.fromARGB(228, 255, 238, 46),
              blurRadius: 10.0,
              offset: Offset(-3.0, 3.0),
            ),
          ],
        ),

        // Use for the name of the character in list-view.
        subtitle1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),

        // Use for the status and number of the character in list-view.
        subtitle2: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
          color: Color.fromARGB(255, 115, 111, 101),
        ),
      ),
    );
  }
}

class CharacterBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
