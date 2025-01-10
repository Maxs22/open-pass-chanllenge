import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:open_pass_challenge/core/constants/assets.dart';
import 'package:open_pass_challenge/core/constants/strings.dart';
import 'package:open_pass_challenge/core/routes/routes.dart';
import 'package:open_pass_challenge/modules/characters/presentation/bindings/characters_bindings.dart';
import 'package:open_pass_challenge/modules/characters/presentation/pages/character_page.dart';
import 'package:open_pass_challenge/modules/splash_screen/presentation/bindings/splash_screen_bindings.dart';
import 'package:open_pass_challenge/modules/splash_screen/presentation/controllers/splash_screen_controller.dart';
import 'package:open_pass_challenge/modules/splash_screen/presentation/pages/splash_screen.dart';

void main() {
  setUp(() {
    // Inicializo las dependencias
    SplashScreenBindings().dependencies();
  });

  tearDown(() {
    // Limpio las dependencias
    Get.delete<SplashScreenController>();
  });

  testWidgets('Verifica que el SplashScreen se renderiza correctamente',
      (WidgetTester tester) async {
    // Renderizo el widget dentro de un entorno de prueba
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: AppRouteName.splashScreen,
        getPages: [
          GetPage(
            name: AppRouteName.splashScreen,
            page: () => const SplashScreen(),
            bindings: [
              SplashScreenBindings(),
            ],
          ),
        ],
      ),
    );

    // Verifico que el texto del título se muestra
    expect(find.text(ConstantsStrings.titleSplash), findsOneWidget);

    // Verifico que el logo se renderiza
    expect(find.byType(Image), findsOneWidget);
    expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image &&
              widget.image is AssetImage &&
              (widget.image as AssetImage).assetName == ConstantsAssets.logo,
        ),
        findsOneWidget);
  });

  testWidgets('Verifica que el SplashScreen navega después de la animación',
      (WidgetTester tester) async {
    // Renderizo el widget dentro de un entorno de prueba
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: AppRouteName.splashScreen,
        getPages: [
          GetPage(
            name: AppRouteName.splashScreen,
            page: () => const SplashScreen(),
            bindings: [
              SplashScreenBindings(),
            ],
          ),
          GetPage(
            name: AppRouteName.characterPage,
            page: () => const CharacterPage(),
            bindings: [
              CharactersBindings(),
            ],
          ),
        ],
      ),
    );

    // Simulo la duración completa de la animación
    await tester.pumpAndSettle(const Duration(seconds: 4));

    // Verifico la navegación
    expect(Get.currentRoute, AppRouteName.characterPage);
  });
}
