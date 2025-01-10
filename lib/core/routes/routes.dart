import 'package:get/get.dart';
import 'package:open_pass_challenge/modules/characters/presentation/bindings/characters_bindings.dart';
import 'package:open_pass_challenge/modules/characters/presentation/pages/character_page.dart';
import 'package:open_pass_challenge/modules/splash_screen/presentation/bindings/splash_screen_bindings.dart';
import 'package:open_pass_challenge/modules/splash_screen/presentation/pages/splash_screen.dart';

final appRoutes = [
  GetPage(
    name: AppRouteName.splashScreen,
    page: () => const SplashScreen(),
    bindings: [
      SplashScreenBindings(),
    ],
  ),
  GetPage(
    name: AppRouteName.characterPage,
    page: () =>  CharacterPage(),
    bindings: [
      CharactersBindings(),
    ],
  ),
];

class AppRouteName {
  static const String splashScreen = '/splashScreen';
  static const String characterPage = '/characterPage';
}
