import 'package:chat_master/others/constants.dart';
import 'package:chat_master/others/themes.dart';
import 'package:chat_master/screens/chats_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Chat master',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      themeMode: themeProvider.selectedThemeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: AppColors.getMaterialColorFromColor(
            themeProvider.selectedPrimaryColor),
        primaryColor: themeProvider.selectedPrimaryColor,
        fontFamily: "Poppins",
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          height: 35,
          padding: const EdgeInsets.all(10.0),
          textStyle: const TextStyle(fontSize: 15, color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                themeProvider.selectedPrimaryColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: AppColors.getMaterialColorFromColor(
            themeProvider.selectedPrimaryColor),
        primaryColor: themeProvider.selectedPrimaryColor,
        fontFamily: "Poppins",
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 35,
          padding: const EdgeInsets.all(10.0),
          textStyle: const TextStyle(fontSize: 15, color: Colors.black),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
      home: const Scaffold(
        body: ChatsPage(),
      ),
    );
  }
}
