import 'package:chat_master/others/chat_users_model.dart';
import 'package:chat_master/screens/chat_details.dart';
import 'package:chat_master/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatefulWidget {
  final ChatUsers user;
  final bool isMessageRead;
  const ConversationList({
    Key? key,
    required this.isMessageRead,
    required this.user,
  }) : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatDetails(user: widget.user))),
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(user: widget.user),
            ),
          );
        },
        child: Stack(
          children: [
            CircleAvatar(
                backgroundImage: AssetImage(widget.user.imageURL),
                maxRadius: 35),
            if (widget.isMessageRead == false)
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
      title: Text(
        widget.user.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        widget.user.messageText,
        style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
            fontWeight:
                widget.isMessageRead ? FontWeight.bold : FontWeight.normal),
      ),
      trailing: Text(
        widget.user.time,
        style: TextStyle(
            fontSize: 12,
            fontWeight:
                widget.isMessageRead ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
