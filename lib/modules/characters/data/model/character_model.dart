import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';

class CharactersModel extends Characters {
  const CharactersModel({
    required super.name,
    required super.gender,
    required super.birthYear,
    required super.eyeColor,
    required super.hairColor,
    required super.height,
    required super.mass,
    required super.homeworld,
    required super.isFavorite,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      name: json['name'] ?? '',
      gender: json['gender'] ?? '',
      birthYear: json['birth_year'] ?? '',
      eyeColor: json['eye_color'] ?? '',
      hairColor: json['hair_color'] ?? '',
      height: json['height'] ?? '',
      mass: json['mass'] ?? '',
      homeworld: json['homeworld'] ?? '',
      isFavorite: false,
    );
  }
}
