import 'package:flutter/material.dart';

import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:job_studio/screen/seeker%20side/explore/controller/get_uploaded_provider.dart';
import 'package:job_studio/screen/seeker%20side/explore/service/comment_service.dart';
import 'package:job_studio/screen/seeker%20side/profile_screen/controller/get_user_profile_provider.dart';
import 'package:provider/provider.dart';

class CommentBox extends StatelessWidget {
  final int indexes;
   CommentBox({super.key,required this.indexes});
 

  @override
  Widget build(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetUploadedServiceProvider>(context, listen: false)
          .fetchUploadedData();
    });
    return Scaffold(
     body: SafeArea(child: Column(
      children: [
        BackButtonAndText(headText: "Comments",
         onTap: (){
          Navigator.pop(context);
         }),
         const SizedBox(height: 20,),
         ///   comment ////
         
         Expanded(
           child:
            Consumer<GetUploadedServiceProvider>(
              builder: (context, value, child) => 
              value.isLoading ?
              const Center(child: CircularProgressIndicator()
              ,)
              : value.uploadedData![indexes].comments.isEmpty?
              const Center(child: Text("No Comments"),)
              :
               ListView.separated(
              itemBuilder: (context, index) {
                return  ListTile(
                  leading:  CircleAvatar(
                    backgroundImage: value.uploadedData![indexes].comments[index].user.profile.profileImage.isNotEmpty
                    ? NetworkImage(value.uploadedData![indexes].comments[index].user.profile.profileImage)
                    : const NetworkImage("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm328-366-tong-08_1.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=6a37204762fdd64612ec2ca289977b5e")
                  ),
                  title: Text(value.uploadedData![indexes].comments[index].user.username),
                  subtitle: Text(value.uploadedData![indexes].comments[index].comment),
                );
                
              },
               separatorBuilder: (context, index) => const Divider(),
                itemCount: value.uploadedData![indexes].comments.length),
            ),
         )
      ],
     )),
     bottomNavigationBar: Container(
      height: 70,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Consumer<UserProfileProvider>(
                builder: (context, value, child) => 
               const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/userProfile.jpg"),
                ),
              ),
              const SizedBox(width: 10,),
              Consumer<GetUploadedServiceProvider>(
                builder: (context, value, child) => 
                 Expanded(
                  child: TextFormField(
                    controller: value.commentText,
                    decoration: const InputDecoration(
                      
                      border: InputBorder.none,
                      hintText: "Comment.."
                    ),
                  ),
                ),
              ),
              Consumer<GetUploadedServiceProvider>(
                builder: (context, value, child) => 
                 IconButton(
                 onPressed: (){
                   CommnetService().commnetService(
                    value.uploadedData![indexes].id,
                    value.commentText.text.trim());
                    value.uploadedData![indexes].comments;
                    value.clearText();
                    
                 },
                  icon: const Icon(Icons.send)),
              )
        
            ],
          ),
        ),
      ),
     )
    );
  }
}