import 'package:chat_master/others/chat_users_model.dart';
import 'package:chat_master/others/constants.dart';
import 'package:chat_master/others/super_provider.dart';
import 'package:chat_master/screens/chat_details.dart';
import 'package:chat_master/screens/chats_page.dart';
import 'package:chat_master/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FriendProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Chat master',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.selectedThemeMode,
      theme: ThemeData(
        useMaterial3: true,
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
        useMaterial3: true,
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
      home: Scaffold(
        body: ResponsiveLayout(
          mobileLayout: const ChatsPage(),
          desktopLayout: Row(
            children: [
              const Expanded(
                flex: 3,
                child: ChatsPage(),
              ),
              Expanded(
                flex: 6,
                child: ChatDetails(
                  user: ChatUsers(
                    name: "Jane Russel",
                    location: 'London, UK',
                    messageText: "Awesome Setup",
                    imageURL: "assets/profiles/userImage1.png",
                    time: "Now",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
