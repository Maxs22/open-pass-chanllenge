import 'package:get/get.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';

class CharactersState {
  final RxBool isLoading;
  final RxString errorMessage;
  final RxList<Characters> characters;
  final RxList<Characters> charactersFavorites;
  final RxList<Characters> charactersAll;
  final RxBool isFavoritesTab;

  CharactersState({
    required this.isLoading,
    required this.errorMessage,
    required this.characters,
    required this.charactersFavorites,
    required this.charactersAll,
    required this.isFavoritesTab
  });

  factory CharactersState.initial() {
    return CharactersState(
      isLoading: false.obs,
      errorMessage: ''.obs,
      characters: <Characters>[].obs,
      charactersFavorites: <Characters>[].obs,
      charactersAll: <Characters>[].obs,
      isFavoritesTab: true.obs
    );
  }
}
