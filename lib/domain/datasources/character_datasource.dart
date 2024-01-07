import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/infrastructure/models/pagination_model.dart';

abstract class CharacterDataSource {
  Future<PaginationModel> getAllCharacters(int page);

  Future<Character> getCharacterById(int id);
  
  Future<PaginationModel> getCharctersByParams(Map<String, dynamic> params);
}
