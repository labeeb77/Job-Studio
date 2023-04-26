import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/controller/chat_provider.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/chat_response_model.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:grouped_list/grouped_list.dart';

class ChatRoom extends StatefulWidget {
  ChatRoom(
      {super.key,
      required this.chatId,
      required this.role,
      required this.index1,
      required this.receiverId});

  final String chatId;
  final String role;
  List<ChatResModel>? chatMessage;
  final int index1;
  final String receiverId;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

late IO.Socket socket;

class _ChatRoomState extends State<ChatRoom> {
  void initSocket() {
    //-----connect to the socket id server----//

    socket = IO.io(ApiConfig.apiBaseUrl, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((data) {
      log("connection established...");
      socket.emit("new-user-add", (widget.receiverId));
      setState(() {
        socket.on(
            "get-users", (data) => log(data.toString(), name: "get User"));
        socket.on("receive-message", (data) {
          log("received");
          log(data.toString(), name: 'Data');

          Provider.of<Chatprovider>(context, listen: false)
              .updateMessage(data["message"]);
        });
        log('received..message', name: 'received');
      });
    });
    socket.onDisconnect((_) => log("connection disconnected"));
    socket.onConnectError((error) => log(error.toString()));
    socket.onError((error) => log(error.toString()));
  }

  String? receiverId;
  String? newRole;
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FlutterSecureStorage storage = const FlutterSecureStorage();
      receiverId = await storage.read(key: "_id");
      initSocket();
      if (context.mounted) {
        await Provider.of<Chatprovider>(context, listen: false)
            .fetchMessage(widget.chatId);
      }
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Consumer<Chatprovider>(
            builder: (context, value, child) => Text(widget.role == "seeker"
                ? value.recruiterChats[widget.index1].username
                : value.filteredChats[widget.index1].username)),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://res.cloudinary.com/zenbusiness/image/upload/v1670445040/logaster/logaster-2020-03-amazon-gif-logo.jpg",
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Consumer<Chatprovider>(
                  builder: (context, value, child) => Expanded(
                    child: TextFormField(
                      controller: value.messageController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Text meassage.."),
                    ),
                  ),
                ),
                Consumer<Chatprovider>(
                  builder: (context, value, child) => IconButton(
                      onPressed: () {
                        Provider.of<Chatprovider>(context, listen: false)
                            .sentMessage(widget.receiverId);
                        sendMessageSocket(
                            Provider.of<Chatprovider>(context, listen: false)
                                .messageController
                                .text
                                .trim());
                        Provider.of<Chatprovider>(context, listen: false)
                            .messageController
                            .clear();
                      },
                      icon: const Icon(Icons.send)),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Consumer<Chatprovider>(
              builder: (context, value, child) => value.chatMessage == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                            child: GroupedListView<ChatResModel, DateTime>(
                          elements: value.chatMessage!,
                          floatingHeader: true,
                          groupBy: (ChatResModel message) => DateTime(
                              message.createdAt.year,
                              message.createdAt.month,
                              message.createdAt.day),
                          groupHeaderBuilder: (ChatResModel message) =>
                              SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                  DateFormat.yMMMd().format(message.createdAt)),
                            ),
                          ),
                          indexedItemBuilder:
                              (context, ChatResModel messge, index) => Align(
                            alignment: widget.receiverId ==
                                    value.chatMessage![index].user
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: widget.receiverId ==
                                            value.chatMessage![index].user
                                        ? BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: const BorderRadius
                                                    .only(
                                                bottomRight: Radius.circular(
                                                  10,
                                                ),
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10)))
                                        : const BoxDecoration(
                                            color: themeColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        value.chatMessage![index].message,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: widget.receiverId !=
                                                    value.chatMessage![index]
                                                        .user
                                                ? kWhiteColor
                                                : null),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                      ],
                    ))),
    );
  }

  // --- functions ----//

  void sendMessageSocket(String message) {
    log("message sending !!");
    socket.emit(
        "send-message", {"receiverId": widget.receiverId, "message": message});
    socket.on("receive-message", (data) {
      log(data.toString());
      log(data.toString());
    });
    log("message send !!!");
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}
