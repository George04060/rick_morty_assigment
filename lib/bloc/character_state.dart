part of 'character_bloc.dart';

@immutable
abstract class CharacterState {
  const CharacterState();

  when(
      {required Widget Function() loading,
      required Widget Function(dynamic characterLoaded) loaded,
      required Text Function() error}) {}
}

class CharacterInitial extends CharacterState {}

class CharacterLoadingState extends CharacterState {
  final String message;

  const CharacterLoadingState({
    required this.message,
  });
}

class CharacterSuccessState extends CharacterState {
  final List<CharacterModel> character;

  const CharacterSuccessState({
    required this.character,
  });
}

class CharacterErrorState extends CharacterState {
  final String error;

  const CharacterErrorState({
    required this.error,
  });
}
