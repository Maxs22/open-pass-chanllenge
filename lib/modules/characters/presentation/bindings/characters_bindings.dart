
import 'package:get/get.dart';
import 'package:open_pass_challenge/modules/characters/data/provider/characters_provider.dart';
import 'package:open_pass_challenge/modules/characters/data/repositories/characters_repository_impl.dart';
import 'package:open_pass_challenge/modules/characters/domain/repositories/characters_repository.dart';
import 'package:open_pass_challenge/modules/characters/domain/usecases/characters_use_case.dart';
import 'package:open_pass_challenge/modules/characters/presentation/controllers/characters.state.dart';
import 'package:open_pass_challenge/modules/characters/presentation/controllers/characters_controllers.dart';

class CharactersBindings extends Bindings {

  @override 
  void dependencies() {
    Get.lazyPut(() => CharactersState.initial());

    Get.lazyPut<CharactersUseCase>(() => CharactersUseCase(repository: Get.find()));

    Get.lazyPut<CharactersController>(() => CharactersController(
      charactersUseCase: Get.find<CharactersUseCase>(),
      state: Get.find<CharactersState>(),
    ));

    Get.lazyPut<ICharactersProvider>(() => CharactersProviderImpl());

    Get.lazyPut<ICharactersRepository>(() => 
    CharactersRepositoryImpl(provider: Get.find<ICharactersProvider>())
    );
  }
}