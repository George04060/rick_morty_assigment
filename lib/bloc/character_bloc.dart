// ignore_for_file: unnecessary_import, implementation_imports

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
import 'package:rick_morty_vendora/app_exporter.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService characterRepository;
  int page = 1;
  bool isFetching = false;

  CharacterBloc({
    required this.characterRepository,
  }) : super(CharacterInitial());

  void fetch() {
    isFetching = true;
    add(const CharacterFetchEvent());
  }

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is CharacterFetchEvent) {
      try {
        yield const CharacterLoadingState(message: 'Loading...');
        isFetching = true;
        final response = await characterRepository.getAllCharacters(page);
        isFetching = false;
        yield CharacterSuccessState(
          character: response.toList(),
        );
        page++;
      } on Exception catch (exc) {
        isFetching = false;
        yield CharacterErrorState(
          error: exc.toString().replaceAll("Exception: ", ""),
        );
      }
    }
  }
}
