import 'package:flutter/cupertino.dart';
import 'package:job_studio/core/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title ;
  final Widget? leading;
  final Widget? titleWidget;
  const CustomAppBar({super.key,this.title = '',this.leading,this.titleWidget});


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 25 /25
    ),
    child: Stack(
      children: [
        Positioned.fill(child: titleWidget == null ?
        Center(child: Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: kBlackColor),),)
        : Center(child: titleWidget!,))
        
      ],
    ),));
  }
  
  @override
  
  Size get preferredSize => const Size(
    double.infinity, 80);
}