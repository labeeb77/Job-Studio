import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:job_studio/screen/seeker%20side/explore/model/get_uploaded_model.dart';
import 'package:job_studio/screen/seeker%20side/explore/service/get_uploaded_service.dart';

class GetUploadedServiceProvider with ChangeNotifier {
  List<GetUploadedModel>? uploadedData ;

  //------ for like ------//
  

  // ---- for comment text controller------ // 
   final TextEditingController commentText = TextEditingController();
  bool isLoading = false;
   String errorMessage = '';

  Future<void>fetchUploadedData()async{
 try{
     isLoading = true;
    notifyListeners();
    List<GetUploadedModel>? result = await GetUploadedService().fetchUploadedService();
    if(result != null){
      uploadedData = result;
      log(uploadedData.toString());
      notifyListeners();

    }
    isLoading = false;
    notifyListeners();
 } catch (e){
  errorMessage = 'Failed to fetch uploaded data: $e';
  isLoading = false;
    notifyListeners();
 }
  }
  void clearText(){
    commentText.clear();
  }
}