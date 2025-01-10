import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetBindings extends Bindings {
  GetBindings();

  @override
  void dependencies() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    Get.lazyPut<SharedPreferences>(() => sharedPreferences);
  }
}
