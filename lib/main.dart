import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_studio/screen/auth/login/controller/local_provider.dart';
import 'package:job_studio/screen/auth/login/controller/login_provider.dart';
import 'package:job_studio/screen/auth/otp%20screen/controller/otp_provider.dart';
import 'package:job_studio/screen/auth/sign%20up/controller/provider.dart';
import 'package:job_studio/screen/recruiter%20side/Add%20recruiter%20profile/controller/add_recru_profile.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/delete_vacancy_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/get_job_provider.dart';
import 'package:job_studio/screen/recruiter%20side/application_screen/controller/vacancy_provider.dart';
import 'package:job_studio/screen/recruiter%20side/bottom%20nav/bottomnav_controller.dart';
import 'package:job_studio/screen/recruiter%20side/home/controller/applied_people_provider.dart';
import 'package:job_studio/screen/seeker%20side/Add%20seeker%20profile/controller/provider.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/service/firebase.dart';
import 'package:job_studio/screen/seeker%20side/application_screen/controller/apply_job_provider.dart';

import 'package:job_studio/screen/splash%20screen/screen_splash.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider(),),
        ChangeNotifierProvider(create: (context) => SignUpProvider(),),
        ChangeNotifierProvider(create: (context) => OtpProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => BottomController(),),
        ChangeNotifierProvider(create: (context) => LocalProvider(),),
        ChangeNotifierProvider(create: (context) => AddRecrPforileProvider(),),
        ChangeNotifierProvider(create: (context) => VacancyProvider(),),
        ChangeNotifierProvider(create: (context) => FirebaseProvider(),),
        ChangeNotifierProvider(create: (context) => GetJobProvider(),),
        ChangeNotifierProvider(create: (context) => DeleteVacancyProvider(),),
        ChangeNotifierProvider(create: (context) => ApplyJobProvider(),),
        ChangeNotifierProvider(create: (context) => AppliedPeopleProvider(),)
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          title: 'Job Studio',
          theme: ThemeData(
           
            primarySwatch: Colors.purple,
            
          ),
          home:   const ScreenSplash(),
        ),
      ),
    );
  }
}

