// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rick_morty_vendora/app_exporter.dart';

class DisplayCharacterScreen extends StatelessWidget {
  const DisplayCharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CharacterBloc(characterRepository: CharacterServiceImplementation())
            ..add(const CharacterFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: AutoSizeText(
              'Rick and Morty',
              style: Theme.of(context).textTheme.headline4,
              maxLines: 1,
            ),
          ),
          elevation: 10,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.wallpapersafari.com/16/45/0SDjZ2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: const CharacterBody(),
      ),
    );
  }
}
