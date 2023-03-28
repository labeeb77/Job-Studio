import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/auth/login/view/widgets/button_widget.dart';
import 'package:job_studio/screen/auth/login/view/widgets/text_field_widgte.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottom_nav_bar.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/backbutton_headtext.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/view/widgets/photo_upload_widget.dart';

class AddRecruiterProfile extends StatelessWidget {
  AddRecruiterProfile({super.key});

  final companyNameController = TextEditingController();
  final emailController = TextEditingController();
  final eshtablishController = TextEditingController();
  final countryController = TextEditingController();
  final companyAddressController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        title: Text("Create Profile",style: GoogleFonts.roboto(
          color: kBlackColor
        ),),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            children: [
          
              // Add profile photo
              const SizedBox(
                height: 15,
              ),
              const PhotoUploadWidget(),
              const SizedBox(
                height: 15,
              ),
              const Text('Upload photo'),

              const SizedBox(
                height: 40,
              ),

              //Name of the company
              MyTextField(
                controller: companyNameController,
                hintText: 'Name of company',
                obscureText: false,
                prefixIcon: const Icon(Icons.business_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),

              // Email
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),

              //Eshtablished date
              MyTextField(
                controller: eshtablishController,
                hintText: 'Eshtablished Date',
                obscureText: false,
                prefixIcon: const Icon(Icons.date_range_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),

              //Country
              MyTextField(
                controller: countryController,
                hintText: 'Country',
                obscureText: false,
                prefixIcon: const Icon(Icons.location_pin),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),

              //Company address
              MyTextField(
                controller: companyNameController,
                hintText: 'Company Address',
                obscureText: false,
                prefixIcon: const Icon(Icons.list),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 30,),
              //Button 
              MyButton(
                onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const BottomNavRecruiter(),));
                },
                 buttonText: "CONFIRM"),
                 const SizedBox(height: 30,),
            ],
          )),
    );
  }
}
