import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/infrastructure/models/character_model.dart';

class PaginationModel {
  int count;
  int pages;
  String? next;
  String? prev;
  List<Character> items;

  PaginationModel({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        count: json["info"]["count"],
        pages: json["info"]["pages"],
        next: json["info"]["next"],
        prev: json["info"]["prev"],
        items: List<Map<String, dynamic>>.from(json["results"])
            .map((character) => CharacterModel.fromJson(character).toEntity())
            .toList(),
      );
}
