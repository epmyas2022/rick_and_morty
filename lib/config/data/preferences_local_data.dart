import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesLocalData {
  final _prefs = SharedPreferences.getInstance();

  Future<void> saveFavorites(List<int> ids) async {
    final prefs = await _prefs;
    prefs.setStringList('favorites', ids.map((id) => id.toString()).toList());
  }

  Future<String> getFavoritesString() async {
    final prefs = await _prefs;
    final favorites = prefs.getStringList('favorites') ?? [];
    return favorites.join(",");
  }
}
