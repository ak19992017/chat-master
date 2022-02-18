import 'package:chat_master/others/chat_users_model.dart';
import 'package:chat_master/widgets/button.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final ChatUsers user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            PopupMenuButton<String>(
              // offset: const Offset(-40, 0),
              tooltip: 'More options',
              enableFeedback: true,
              icon: const Icon(EvaIcons.moreVertical),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Edit profile', 'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -100,
                          left: (MediaQuery.of(context).size.width - 200) / 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              widget.user.imageURL,
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            widget.user.name,
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.user.location,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          SuperButton(
                            label: 'Change photo',
                            icon: EvaIcons.upload,
                            onPress: () {
                              final snackBar = SnackBar(
                                elevation: 10,
                                content: const Text(
                                  'Image Uploaded! Looking good😏',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.all(25),
                                backgroundColor: Theme.of(context).primaryColor,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Edit profile':
        break;
      case 'Logout':
        break;
    }
  }
}
