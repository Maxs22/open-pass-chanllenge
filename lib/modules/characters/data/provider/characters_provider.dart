import 'package:get/get.dart';
import 'package:open_pass_challenge/core/services/debug_service.dart';
import 'package:open_pass_challenge/modules/characters/data/model/character_model.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';

abstract class ICharactersProvider {
  Future<List<Characters>> getCharacters();
}

class CharactersProviderImpl extends GetConnect implements ICharactersProvider {
  @override
  Future<List<Characters>> getCharacters() async {
    final response = await get(
      'https://swapi.py4e.com/api/people',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      List<Characters> charactersList = [];
      for (var item in response.body['results']) {
        charactersList.add(CharactersModel.fromJson(item));
      }
      return charactersList;
    } else {
      DebugService.debugLog(
          '$runtimeType] - Error code: ${response.statusCode}. Message: ${response.body.toString()}');
      throw Exception(
          'Error code: ${response.statusCode}. Message: ${response.body.toString()}');
    }
  }
}
