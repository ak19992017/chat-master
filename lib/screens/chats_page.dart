import 'package:chat_master/screens/conversations.dart';
import 'package:chat_master/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const SuperDrawer(),
      body: const ConversationsScreen(),
    );
  }
}
