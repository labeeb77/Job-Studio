import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:job_studio/api/api_url.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/chat_response_model.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/get_chat_model.dart';
import 'package:job_studio/screen/recruiter%20side/chat_screen/model/send_chat_model.dart';

class ChatServices {

  //-------- post chat--------//
  Dio dio = Dio();
  Future sendMessageService(SendChatModel model) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path = ApiConfig.apiBaseUrl + ApiConfig.postChat;

    try {
      Response response = await dio.post(path,
          data: model.toJson(),
          options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
      }
    } on DioError catch (e) {
      log(e.message.toString());
      log("error post chat");
    }
  }
   // -------- get all chat------//
Future<GetAllChatModel?> fetchChatService ()async{
   FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path = ApiConfig.apiBaseUrl + ApiConfig.getChat;
     try{
      Response response = await dio.get(path,options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
        return GetAllChatModel.fromJson(response.data[0]);
      }
     } on DioError catch(e){
      log(e.message.toString());
      log("error getting chat");
     }
     return null;

}
 
 //---------get chat message ------//
 Future <List<ChatResModel>?> fetchMessageService(String chatId)async{
     FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: "access_token");
    String? accessToken = token!.replaceAll('"', '');
    String path = "${ApiConfig.apiBaseUrl}${ApiConfig.getChat}/$chatId";
     try{
      Response response = await dio.get(path,options: Options(headers: {"authorization": "Bearer $accessToken"}));
      if(response.statusCode == 200 || response.statusCode == 201){
        log(response.data.toString());
        final List<ChatResModel> model = (response.data as List)
        .map((e) => ChatResModel.fromJson(e)).toList();
        return model;
      }
     } on DioError catch(e){
      log(e.message.toString());
      log("error getting chatMesege");
     }
     return null;
 }
 
   
}
