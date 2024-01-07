import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/respositories/character_repository.dart';
import 'package:rick_and_morty/infrastructure/models/pagination_model.dart';

class DiscoverProvider extends ChangeNotifier {
  final CharacterRepository characterRepository;

  final ScrollController _scrollController = ScrollController();

  get scrollController => _scrollController;

  int page = 1;
  int count = 0;
  int pages = 0;
  String? next;
  String? prev;
  Map<String, dynamic> _params = {};
  List listCharacters = [];
  bool isLoading = true;

  DiscoverProvider({required this.characterRepository}) {
    _scrollController.addListener(scrollListener);
  }
  Future<void> getCharacters() async {
    PaginationModel paginationCharacters =
        await characterRepository.getAllCharacters(page);
    listCharacters += paginationCharacters.items;
    count = paginationCharacters.count;
    pages = paginationCharacters.pages;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getCharactersByParams(Map<String, dynamic> params) async {
    PaginationModel paginationCharacters = await characterRepository
        .getCharctersByParams({'page': page, ...params});
    listCharacters = paginationCharacters.items;
    page = 1;
    params = params;
    count = paginationCharacters.count;
    pages = paginationCharacters.pages;

    isLoading = false;
    notifyListeners();
  }

  Future<void> scrollListener() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        page < pages) {
      page++;

      if (_params.isEmpty) {
        await getCharacters();
      } else {
        await getCharactersByParams(_params);
      }
    }
  }
}
