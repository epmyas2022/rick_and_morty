class Character {
  final int id;
  final String name;
  final String status;
  final String? species;
  final String? type;
  final String? gender;
  final String image;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      this.species,
      this.type,
      this.gender,
      required this.image});
}
