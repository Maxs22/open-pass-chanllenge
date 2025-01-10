import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';
import 'package:open_pass_challenge/modules/characters/presentation/bindings/characters_bindings.dart';
import 'package:open_pass_challenge/modules/characters/presentation/controllers/characters.state.dart';
import 'package:open_pass_challenge/modules/characters/presentation/controllers/characters_controllers.dart';

void main() {
  late CharactersController controller;
  late CharactersState state;

  setUp(() {
    // Mock de SharedPreferences
    SharedPreferences.setMockInitialValues({});

    // Inicializo las dependencias con GetX
    CharactersBindings().dependencies();
    controller = Get.find<CharactersController>();
    state = Get.find<CharactersState>();
  });

  group('Pruebas de CharactersController', () {
    test('debería empezar con el estado inicial', () {
      expect(state.isLoading.value, true);
      expect(state.errorMessage.value, '');
    });

    test('debería filtrar los personajes según la consulta', () {
      // Arrange
      final mockCharacters = [
        Characters(name: 'Rick Sanchez', isFavorite: false),
        Characters(name: 'Morty Smith', isFavorite: false),
        Characters(name: 'Summer Smith', isFavorite: false),
      ];
      state.characters.assignAll(mockCharacters);

      // Act
      controller.filterByText('Rick');

      // Assert
      expect(state.charactersAll.length, 1);
      expect(state.charactersAll.first.name, 'Rick Sanchez');
    });

    test('debería alternar correctamente el estado de favorito', () {
      // Arrange
      final character = Characters(name: 'Rick Sanchez', isFavorite: false);
      state.characters.add(character);
      state.charactersAll.add(character);

      // Act
      controller.toggleFavorite(character);

      // Assert
      expect(state.characters.first.isFavorite, true);
      expect(state.charactersFavorites.length, 1);

    });

    test('debería actualizar el mensaje de error cuando ocurra un error', () {
      // Act
      state.errorMessage.value = 'Ocurrió un error';

      // Assert
      expect(state.errorMessage.value, 'Ocurrió un error');
    });

    test(
        'debería manejar una consulta de filtro vacía y mostrar todos los personajes',
        () {
      // Arrange
      final mockCharacters = [
        Characters(name: 'Rick Sanchez', isFavorite: false),
        Characters(name: 'Morty Smith', isFavorite: false),
      ];
      state.characters.assignAll(mockCharacters);

      // Act
      controller.filterByText('');

      // Assert
      expect(state.charactersAll.length, mockCharacters.length);
    });
  });
}
