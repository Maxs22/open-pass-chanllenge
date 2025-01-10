import 'package:get/get.dart';
import 'package:open_pass_challenge/core/errors/failures/base_failure.dart';
import 'package:open_pass_challenge/core/services/debug_service.dart';
import 'package:open_pass_challenge/core/use_cases/base_use_case.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';
import 'package:open_pass_challenge/modules/characters/domain/usecases/characters_use_case.dart';
import 'package:open_pass_challenge/modules/characters/presentation/controllers/characters.state.dart';
import 'package:open_pass_challenge/user_preferences/user_preferences.dart';

abstract class ICharactersController {
  Future<void> getCharacters();
}

class CharactersController extends GetxController
    implements ICharactersController {
  CharactersController({
    required this.charactersUseCase,
    required this.state,
  });

  final CharactersUseCase charactersUseCase;
  final CharactersState state;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCharacters();
    await loadFavorites();
  }

  @override
  Future<void> getCharacters() async {
    state.isLoading.value = true;

    var result = await charactersUseCase.call(NoParams());
    result.fold((BaseFailure error) {
      DebugService.debugLog(
          '[$runtimeType] - Error al intentar obtener los Personajes...');

      if (error is ServerFailure) {
        state.errorMessage.value = error.errorMessage;
      } else {
        state.errorMessage.value =
            'Error al intentar obtener los Personajes...';
      }
      state.isLoading.value = false;
    }, (List<Characters> characters) async {
      DebugService.debugLog(
          '[$runtimeType] - Personajes obtenidos con éxito...');
      state.characters.assignAll(characters); // cargo lista principal
      state.charactersAll.assignAll(characters); // cargo lista visible
      await loadFavorites();
      state.isLoading.value = false;
    });
  }

  void filterByText(String query) {
    if (query.isEmpty) {
      // Consulta vacia
      state.charactersAll.assignAll(state.characters);
    } else {
      // Filtro por nombre
      final filtered = state.characters.where((character) {
        final name = character.name!.toLowerCase();
        return name.contains(query.toLowerCase());
      }).map((character) {
        // favoritos se conserve cuando filtro
        final isFavorite = state.charactersFavorites
            .any((favCharacter) => favCharacter.name == character.name);
        return character.copyWith(isFavorite: isFavorite);
      }).toList();

      state.charactersAll.assignAll(filtered);
    }
  }

  void toggleFavorite(Characters character) {
    final index = state.characters
        .indexWhere((element) => element.name == character.name);
    final updatedCharacter =
        character.copyWith(isFavorite: !character.isFavorite);
    state.characters[index] = updatedCharacter;
    state.charactersAll[index] = updatedCharacter;

    if (updatedCharacter.isFavorite) {
      state.charactersFavorites.add(updatedCharacter);
    } else {
      state.charactersFavorites
          .removeWhere((element) => element.name == updatedCharacter.name);
    }
    _saveFavorites();
  }

  // Guardo la lista  en SharedPreferences
  void _saveFavorites() {
    List<String> favoriteName =
        state.charactersFavorites.map((character) => character.name!).toList();
    saveFavoriteCharacters(favoriteName);
  }

  Future<void> loadFavorites() async {
    // favoritos desde SharedPreferences
    var favoriteNames = await getFavoriteCharacters();

    // Actualizo fav en lista principal
    state.characters.assignAll(state.characters.map((character) {
      final isFavorite = favoriteNames.contains(character.name);
      return character.copyWith(isFavorite: isFavorite);
    }).toList());

    // Reflejar los cambios en la lista en pantalla
    state.charactersAll.assignAll(state.characters);

    state.charactersFavorites.assignAll(
      state.characters.where((character) => character.isFavorite).toList(),
    );
  }
}
