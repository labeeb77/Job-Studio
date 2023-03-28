import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_studio/core/colors.dart';

class GoogleSignButton extends StatelessWidget {
  final String googleButtonText;
 const GoogleSignButton({
  
    super.key,
    required this.googleButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          border: Border.all(color: themeColor),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/images/1534129544.svg',
            height: 30,
          ),
           Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              googleButtonText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
