import 'package:chat_master/others/chat_message_model.dart';
import 'package:chat_master/others/chat_users_model.dart';
import 'package:chat_master/screens/profile_screen.dart';
import 'package:chat_master/widgets/circular_icon_button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ChatDetails extends StatefulWidget {
  final ChatUsers user;

  const ChatDetails({Key? key, required this.user}) : super(key: key);

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              EvaIcons.arrowBack,
              color: Colors.white,
            ),
            tooltip: 'Back',
          ),
          flexibleSpace: Row(
            children: <Widget>[
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: widget.user),
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.user.imageURL),
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
                      widget.user.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "Online",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                EvaIcons.video,
                color: Colors.white,
              ),
              tooltip: 'Video call',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                EvaIcons.phone,
                color: Colors.white,
              ),
              tooltip: 'Voice call',
            ),
            PopupMenuButton<String>(
              // offset: const Offset(-40, 0),
              tooltip: 'More options',
              enableFeedback: true,
              icon: const Icon(EvaIcons.moreVertical, color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: handleClick,
              itemBuilder: (context) {
                return {
                  'Block',
                  'View profile',
                  'Media, links and docs',
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
                      top: 10,
                      bottom: 10,
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
                                fontSize: 20,
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
                          )
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
                margin: const EdgeInsets.only(left: 5, bottom: 10),
                // height: 60,
                constraints: const BoxConstraints(minHeight: 60),
                width: MediaQuery.of(context).size.width - 80,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
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
                                      icon: EvaIcons.pinOutline,
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
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
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
