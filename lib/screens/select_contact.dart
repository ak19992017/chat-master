import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SelectContactScreen extends StatelessWidget {
  const SelectContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Select Contact',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('75 contacts', style: TextStyle(fontSize: 15)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.search),
            tooltip: 'Search',
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            tooltip: 'More options',
            enableFeedback: true,
            icon: const Icon(EvaIcons.moreVertical, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onSelected: handleClick,
            itemBuilder: (context) {
              return {
                'Invite a friend',
                'Contacts',
                'Refresh',
                'Help',
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      default:
        break;
    }
  }
}
