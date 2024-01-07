import 'package:rick_and_morty/config/helpers/api_data.dart';
import 'package:rick_and_morty/domain/datasources/character_datasource.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/infrastructure/models/pagination_model.dart';

class ApiFetchDataSourceImpl implements CharacterDataSource {
  @override
  Future<PaginationModel> getAllCharacters(int page) async {
    final data = await ApiData().getFetchCharacters(page: page);

    return PaginationModel.fromJson(data);
  }

  @override
  Future<PaginationModel> getCharctersByParams(
      Map<String, dynamic> params) async {
    final data = await ApiData().getFetchCharactersParams(params: params);

    return PaginationModel.fromJson(data);
  }

  @override
  Future<Character> getCharacterById(int id) {
    // TODO: implement getCharacterById
    throw UnimplementedError();
  }
}
