// ignore_for_file: unused_import

import 'package:chat_master/others/api_emoji.dart';
import 'package:chat_master/others/chat_message_model.dart';
import 'package:chat_master/others/chat_users_model.dart';
import 'package:chat_master/others/super_provider.dart';
import 'package:chat_master/widgets/button.dart';
import 'package:chat_master/widgets/circular_icon_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatDetails extends StatefulWidget {
  final ChatUsers user;

  const ChatDetails({Key? key, required this.user}) : super(key: key);

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var friendProvider = context.watch<FriendProvider>();
    ChatUsers user = chatUsers[friendProvider.friendSelectedToChat];
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () => Navigator.pop(context),
          //   icon: const Icon(
          //     EvaIcons.arrowBack,
          //     color: Colors.white,
          //   ),
          //   tooltip: 'Back',
          // ),
          flexibleSpace: Row(
            children: <Widget>[
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(user.imageURL),
                  maxRadius: 25,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if ((friendProvider.friendSelectedToChat % 3 == 0) == false)
                      const Text(
                        "Online",
                        style: TextStyle(fontSize: 13),
                      ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(EvaIcons.video),
              tooltip: 'Video call',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(EvaIcons.phone),
              tooltip: 'Voice call',
            ),
            PopupMenuButton<String>(
              // offset: const Offset(-40, 0),
              tooltip: 'More options',
              enableFeedback: true,
              icon: const Icon(EvaIcons.moreVertical),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: handleClick,
              itemBuilder: (context) {
                return {
                  'View profile',
                  'Search',
                  'Mute notifications',
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
        body: Stack(
          children: <Widget>[
            // MESSAGE LIST SECTION
            SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, bottom: 75),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: messages[index].messageType == "receiver" ? 14 : 60,
                      right:
                          messages[index].messageType == "receiver" ? 60 : 14,
                      top: 6,
                      bottom: 6,
                    ),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType == "receiver"
                                  ? Colors.grey.shade300
                                  : Theme.of(context).primaryColor),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    (messages[index].messageType == "receiver"
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Text(
                            DateTime.now().hour.toString() +
                                ":" +
                                DateTime.now()
                                    .minute
                                    .toString()
                                    .padLeft(2, "0"),
                            // style: const TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // BOTTOM TEXT BOX
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: kElevationToShadow[3],
                ),
                margin: const EdgeInsets.only(left: 5, bottom: 10, right: 5),
                // height: 60,
                constraints: const BoxConstraints(minHeight: 60),
                width: MediaQuery.of(context).size.width - 80,
                child: Row(
                  children: [
                    // const SizedBox(width: 15),
                    IconButton(
                      icon: const Icon(
                        Icons.emoji_emotions_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          context: context,
                          constraints: const BoxConstraints(maxWidth: 500),
                          builder: (context) {
                            return const MyEmoji();
                          },
                        );
                      },
                    ),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: "Write a message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // const SizedBox(width: 15),
                    IconButton(
                      icon: const Icon(
                        EvaIcons.attach,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          context: context,
                          constraints: const BoxConstraints(maxWidth: 500),
                          builder: (context) {
                            return Column(
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularIconButton(
                                      label: 'Document',
                                      icon: EvaIcons.file,
                                      color: Colors.purple,
                                      onPress: () {},
                                    ),
                                    CircularIconButton(
                                      label: 'Camera',
                                      icon: Icons.photo_camera,
                                      color: Colors.red,
                                      onPress: () {},
                                    ),
                                    CircularIconButton(
                                      label: 'Gallery',
                                      icon: EvaIcons.image,
                                      color: Colors.pink,
                                      onPress: () {},
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CircularIconButton(
                                      label: 'Audio',
                                      icon: EvaIcons.headphones,
                                      color: Colors.orange,
                                      onPress: () {},
                                    ),
                                    CircularIconButton(
                                      label: 'Location',
                                      icon: EvaIcons.pin,
                                      color: Colors.green,
                                      onPress: () {},
                                    ),
                                    CircularIconButton(
                                      label: 'Contact',
                                      icon: EvaIcons.person,
                                      color: Colors.blue,
                                      onPress: () {},
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        endDrawer: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Drawer(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        currentAccountPicture: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            user.imageURL,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        // curve: Curves.bounceOut,
                        // child: Text('Drawer Header'),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        accountEmail: const Text('ak19992017@gmail.com'),
                        accountName: Text(user.name),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(EvaIcons.attach2),
                          title: const Text('Media, links and docs'),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.block),
                          title: const Text('Block '),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.thumb_down),
                          title: const Text('Report'),
                          onTap: () {},
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: const Icon(EvaIcons.trash2),
                          title: const Text('Delete chat'),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'View profile':
        {
          _scaffoldKey.currentState!.openEndDrawer();
          break;
        }
      default:
        break;
    }
  }
}
