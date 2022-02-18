import 'package:chat_master/others/chat_users_model.dart';
import 'package:chat_master/widgets/conversation_list.dart';
import 'package:flutter/material.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header UI
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Text(
              "Messages",
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
            ),
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
              ),
            ),
          ),
          //conversation list view
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: chatUsers.length,
              padding: const EdgeInsets.only(top: 20, bottom: 80),
              itemBuilder: (context, index) {
                return ConversationList(
                  user: chatUsers[index],
                  isMessageRead: (index % 3 == 0) ? true : false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
