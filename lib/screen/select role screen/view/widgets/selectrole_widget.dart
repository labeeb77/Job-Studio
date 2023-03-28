import 'package:flutter/cupertino.dart';


class SelectRoleWidget extends StatelessWidget {
  final String roleText;
  final Widget roleImage;
  final  Function()? onTap;
  const SelectRoleWidget({super.key,required this.roleText,required this.roleImage,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                     border: Border.all(color: const Color(0xFF8b157f)),
            borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    roleImage,
                    const SizedBox(height: 15,),
                     Text(roleText,style:const TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)
                  ],
    
                ),
              ),
    );
  }
}