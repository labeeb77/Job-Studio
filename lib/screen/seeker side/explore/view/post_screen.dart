import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/recruiter%20side/home/view/widgets/custom_card.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/image_provider.dart';
import 'package:job_studio/screen/seeker%20side/explore/controller/post_controller.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Post",
          style: TextStyle(color: kBlackColor),
        ),
      ),
      body: SafeArea(
          child: Consumer2<PickImageProvider,PostImageController>(
            builder: (context, value,value2, child) => 
            Column(
                  children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
              child: Box(
                child: TextFormField(
                  controller: value2.descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "enter your description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Provider.of<PickImageProvider>(context,listen: false).pickImage();
          
              },
              splashColor: themeColor,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: themeColor),
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                  child: Text("Add Image"),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Box(child:
              value.galleryImage == null
              ? Image.asset ("assets/images/defaultImage.png",fit: BoxFit.cover,)
              : Image.file(value.galleryImage!,fit: BoxFit.cover,)),
            ),
            const SizedBox(height: 60,),
            MyButton(
              onTap: ()async{
               await Provider.of<PostImageController>(context,listen: false).postImage(context).then((value) => Navigator.of(context).pop());
              }, buttonText: "POST")
                  ],
                ),
          )),
    );
  }
}
