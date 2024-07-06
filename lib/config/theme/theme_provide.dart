import 'package:aprendiendoflutter/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final themeNotifierProvider =
    StateNotifierProvider<ThemeProvider, AppTheme>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends StateNotifier<AppTheme> {
  ThemeProvider() : super(AppTheme());
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
