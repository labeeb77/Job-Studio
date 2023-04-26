import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/chat_response_model.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/get_chat_model.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/send_chat_model.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/service/chat_services.dart';

class Chatprovider with ChangeNotifier{
  List<ChatResModel>? chatMessage;
  List<Member>? fetchedChats;
  String? chatId;
  List<Member>filteredChats = [];
  List<Member>recruiterChats = [];
  bool isLoading = false;

//--------send message provider ----//
TextEditingController messageController = TextEditingController();

Future sentMessage(String recieverId)async{
  isLoading = true;
  final message = messageController.text.trim();
  final sendModel = SendChatModel(message: message, receiverId: recieverId);
  ChatServices().sendMessageService(sendModel);

}




//-------- get chat provider-----//

  Future<void>fetchChats()async{
    isLoading = true;
    notifyListeners();
    await ChatServices().fetchChatService().then((value) {
      fetchedChats = value!.members;
      notifyListeners();
      chatId = value.id;
      notifyListeners();
      filteredChats.clear();
      notifyListeners();
      recruiterChats.clear();
      notifyListeners();
      for (var element in fetchedChats!){
        if(element.role == "seeker"){
          filteredChats.add(element);
          notifyListeners();
        }else{
          recruiterChats.add(element);
          notifyListeners();
          log(recruiterChats.toString());
        }
      }
      notifyListeners();
      isLoading = false;
      notifyListeners();
      
    });
    log(fetchedChats.toString());
  }
 
 //---------get message provider ---------//

  Future<void>fetchMessage (String chatId)async{
    isLoading = true;
    notifyListeners();
    await ChatServices().fetchMessageService(chatId).then((value) {
      chatMessage = value;
      notifyListeners();
      isLoading = false;
      notifyListeners();
      
    });
    isLoading = false;
    notifyListeners();
    log(chatMessage.toString());
  }
  void updateMessage(String message){
    ChatResModel model = ChatResModel(message: message, createdAt: DateTime.now());
    chatMessage!.add(model);
    notifyListeners();
  }
}