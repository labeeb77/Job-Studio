import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  const OtpField({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  height: 60,
                  width: 50,
                  child: TextField(
                    controller: controller,
                      decoration:  InputDecoration(
              
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:Color.fromARGB(255, 136, 133, 133),
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF8b157f)),
                borderRadius: BorderRadius.circular(12)
              ),
           
                
            ),
                    onChanged: (value){
                      if(value.length==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headlineSmall,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                );
  }
}