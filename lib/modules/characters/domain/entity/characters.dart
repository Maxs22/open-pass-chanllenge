import 'package:equatable/equatable.dart';
import 'package:open_pass_challenge/modules/characters/data/model/character_model.dart';

class Characters extends Equatable {
  const Characters({
    this.name = '',
    this.gender = '',
    this.birthYear = '',
    this.eyeColor = '',
    this.hairColor = '',
    this.height = '',
    this.mass = '',
    this.homeworld = '',
    this.isFavorite = false,
  });

  final String? name;
  final String? gender;
  final String? birthYear;
  final String? eyeColor;
  final String? hairColor;
  final String? height;
  final String? mass;
  final String? homeworld;
  final bool isFavorite;

  Characters copyWith({
    String? name,
    String? gender,
    String? birthYear,
    String? eyeColor,
    String? hairColor,
    String? height,
    String? mass,
    String? homeworld,
    required bool isFavorite, // Nueva propiedad
  }) {
    return Characters(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthYear: birthYear ?? this.birthYear,
      eyeColor: eyeColor ?? this.eyeColor,
      hairColor: hairColor ?? this.hairColor,
      height: height ?? this.height,
      mass: mass ?? this.mass,
      homeworld: homeworld ?? this.homeworld,
      isFavorite: isFavorite,
    );
  }

  CharactersModel toModel() {
    return CharactersModel(
      name: name,
      gender: gender ?? '',
      birthYear: birthYear ?? '',
      eyeColor: eyeColor ?? '',
      hairColor: hairColor ?? '',
      height: height ?? '',
      mass: mass ?? '',
      homeworld: homeworld ?? '',
      isFavorite: isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        name,
        gender,
        birthYear,
        eyeColor,
        hairColor,
        height,
        mass,
        homeworld,
        isFavorite,
      ];
}
