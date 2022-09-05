import 'package:chat_master/others/constants.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode selectedThemeMode = ThemeMode.dark;
  Color selectedPrimaryColor = AppColors.primaryColors[2];

  setSelectedThemeMode(ThemeMode _themeMode) {
    selectedThemeMode = _themeMode;
    notifyListeners();
  }

  setSelectedPrimaryColor(Color _color) {
    selectedPrimaryColor = _color;
    notifyListeners();
  }
}

class FriendProvider extends ChangeNotifier {
  int friendSelectedToChat = 0;

  setFriendSelectedToChat(int f) {
    friendSelectedToChat = f;
    notifyListeners();
  }
}
