import 'package:rick_and_morty/domain/entities/character.dart';

class CharacterModel {
  int id;
  String name;
  String status;
  String? species;
  String? type;
  String? gender;
  String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    this.species,
    this.type,
    this.gender,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        image: json["image"],
      );
  Character toEntity() => Character(
      id: id,
      name: name,
      status: status,
      image: image,
      gender: gender,
      species: species,
      type: type);
}
