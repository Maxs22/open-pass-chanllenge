import 'package:shared_preferences/shared_preferences.dart';

// Guardar lista de favoritos
Future<void> saveFavoriteCharacters(List<String> favoriteNames) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('favorite_characters', favoriteNames);
}

// Cargar lista de favoritos
getFavoriteCharacters() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favorite_characters') ?? [];
}

// Eliminar lista de favoritos
Future<void> clearFavorites() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('favorite_characters');
}
