import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class SeekerChatScreen extends StatelessWidget {
  const SeekerChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        title:const Text("Chat Box",style: TextStyle(color: kBlackColor),),
      ),
      body: SafeArea(child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 13),
                placeholder: 'Search',
              ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text("Amazone"),
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage("https://res.cloudinary.com/zenbusiness/image/upload/v1670445040/logaster/logaster-2020-03-amazon-gif-logo.jpg",),
                    ),
                    subtitle: const Text("Congratulations!!"),
                    trailing: Container(decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeColor
                    ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text("13",style: TextStyle(color: kWhiteColor),),
                      )),
                  ),
                ),
              );
            },
          
            itemCount: 10,),
          )
        ],
      )),
    );
  }
}