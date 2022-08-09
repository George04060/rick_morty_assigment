import 'package:rick_morty_vendora/repository/model/character_model.dart';

abstract class CharacterService {
  Future<List<CharacterModel>> getAllCharacters(int page);
}
