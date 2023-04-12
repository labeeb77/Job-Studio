import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/seeker%20side/explore/view/post_screen.dart';
import 'package:like_button/like_button.dart';
import 'package:readmore/readmore.dart';

import 'comment_box.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Explore",style: TextStyle(color: kBlackColor),),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100]),
              child:  TextButton(onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PostScreen(),));
              }, child: const Text("Post")),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
        
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                  
                      child: Column(
                        children: [
                           ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage("assets/images/man.png"),
                            ),
                            title: const Text("Mohammed labeeb"),
                            subtitle: const Text("Flutter Developer"),
                            trailing: IconButton(onPressed: (){}, icon: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(Icons.more_vert),
                            )),
                            
                          ),
                          Image.network("https://pbs.twimg.com/media/FsAAxU8XsAUy67y?format=jpg&name=small"),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Row(children: [
                              const LikeButton(
                                likeCount: 50,
                                size: 26,
                              ),
                              IconButton(onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CommentBox(),));
                              }, icon: const Icon(Icons.comment,color: kGreyColor,)),
                              const Spacer(),
                               IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border,color: kGreyColor,))
                            ],),
                          ),
                          const SizedBox(height: 5,),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ReadMoreText(
                              "Flutter is an open source framework to create high quality, high performance mobile applications across mobile operating systems - Android and iOS. It provides a simple, powerful, efficient and easy to understand SDK to write mobile application in Google’s own language, Dart. This tutorial walks through the basics of Flutter framework, installation of Flutter SDK,",
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "...read more",
                               colorClickableText: Color.fromARGB(255, 10, 107, 187),
                                trimExpandedText: ' show less',
                                textAlign: TextAlign.justify,
                                 moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: themeColor),
                                 
                          
                          
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                },),
            )
          ],
        )),
    );
  }
}