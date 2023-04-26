import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/controller/chat_provider.dart';
import 'package:job_studio/screen/seeker%20side/chat_screen/view/chat_room.dart';
import 'package:provider/provider.dart';

class RecruiterChatScreen extends StatelessWidget {
  RecruiterChatScreen({super.key});
  String? newRole;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      final role = await storage.read(key: "role");
      newRole = role!.replaceAll('"', '');
      log("/////////////////");
      log(role.toString());
      if (context.mounted) {
        Provider.of<Chatprovider>(context, listen: false).fetchChats();
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Chat Box",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 13),
              placeholder: 'Search',
            ),
          ),
          Expanded(
            child: Consumer<Chatprovider>(
              builder: (context, value, child) => value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                Provider.of<Chatprovider>(context,
                                        listen: false)
                                    .fetchMessage(value.chatId!);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatRoom(
                                      chatId: value.chatId!,
                                      role: newRole!,
                                      index1: index,
                                      receiverId: newRole == "seeker"
                                          ? value.recruiterChats[index].id
                                          : value.filteredChats[index].id),
                                ));
                                log("//////////////////////////////////////////////////////////////////////////////");
                                log(newRole.toString());
                              },
                              title: Text(newRole == "seeker"
                                  ? value.recruiterChats[index].username
                                  : value.filteredChats[index].username),
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://res.cloudinary.com/zenbusiness/image/upload/v1670445040/logaster/logaster-2020-03-amazon-gif-logo.jpg",
                                ),
                              ),
                              subtitle: Text(newRole == "seeker"
                                  ? "congratulations!!"
                                  : "thank you"),
                              trailing: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: themeColor),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "13",
                                      style: TextStyle(color: kWhiteColor),
                                    ),
                                  )),
                            ),
                          ),
                        );
                      },
                      itemCount: newRole == "seeker"
                          ? value.recruiterChats.length
                          : value.filteredChats.length,
                    ),
            ),
          )
        ],
      )),
    );
  }
}
