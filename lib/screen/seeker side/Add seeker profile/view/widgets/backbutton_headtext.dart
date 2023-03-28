import 'package:flutter/material.dart';
import 'package:job_studio/core/colors.dart';

class BackButtonAndText extends StatelessWidget {
  final String headText;
 final Function()? onTap;

 const BackButtonAndText({
    super.key,
    required this.headText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return // Back Button
        Padding(
      padding: const EdgeInsets.only(top: 13, left: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200]),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 40,
                  color: themeColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // Head Text
           Text(
            headText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
