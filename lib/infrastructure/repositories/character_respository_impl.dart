import 'package:rick_and_morty/domain/datasources/character_datasource.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/domain/respositories/character_repository.dart';
import 'package:rick_and_morty/infrastructure/models/pagination_model.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDataSource characterDataSource;

  CharacterRepositoryImpl({required this.characterDataSource});

  @override
  Future<PaginationModel> getAllCharacters(int page) async {
    return await characterDataSource.getAllCharacters(page);
  }

  @override
  Future<PaginationModel> getCharctersByParams(
      Map<String, dynamic> params) async {
    return await characterDataSource.getCharctersByParams(params);
  }

  @override
  Future<Character> getCharacterById(int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }
}
